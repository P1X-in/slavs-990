
const NEAR_SCREEN_THRESHOLD = 0.2
const MAP_STEP = 0.01
const PAN_THRESHOLD = 20

var bag

var camera
var zoom
var locked = true
var pan_to_position
var game_size
var movement_time_delta
var panning = false
var dragging = false

var max_camera_move

func _init_bag(bag):
    self.bag = bag
    self.camera = self.bag.board.screen_scene.get_node('viewport/camera')
    self.update_zoom()

    var half_screen_size = self.bag.root.get_size() / Vector2(2, 2)
    self.max_camera_move = self.bag.map.TILE_SIZE * self.bag.abstract_map.MAX_MAP_DIMENSION

    self.camera.set_limit(0, 0)
    self.camera.set_limit(1, 0)
    self.camera.set_limit(2, self.max_camera_move)
    self.camera.set_limit(3, self.max_camera_move)

func attach():
    self.bag.processing.register(self)
    self.camera.make_current()

func detach():
    self.bag.processing.remove(self)

func get_pos():
    return self.camera.get_offset()

func set_pos(position):
    if position.x < 0:
        position.x = 0
    if position.x > self.max_camera_move:
        position.x = self.max_camera_move
    if position.y < 0:
        position.y = 0
    if position.y > self.max_camera_move:
        position.y = self.max_camera_move

    self.pan_to_position = position
    self.camera.set_offset(position)

func offset_camera(offset):
    var position = self.get_pos()
    position = position + offset
    self.set_pos(position)

func pan_to(position):
    self.game_size = self.bag.root.get_size()
    self.update_zoom()

    var self_pos = self.get_pos()
    var target_position = self.bag.map.tilemap.map_to_world(position)
    var diff_x = target_position.x - self_pos.x
    var diff_y = target_position.y - self_pos.y
    var near_x = self.game_size.x * (self.NEAR_SCREEN_THRESHOLD * self.zoom.x)
    var near_y = self.game_size.y * (self.NEAR_SCREEN_THRESHOLD * self.zoom.y)

    if diff_x > -near_x && diff_x < near_x && diff_y > -near_y && diff_y < near_y:
        return

    self.panning = true
    self.pan_to_position = position

func update_zoom():
    self.zoom = self.camera.get_zoom()

func lock():
    self.locked = true
func unlock():
    self.locked = false

func process(delta):
    if self.locked:
        return

    var self_pos = self.get_pos()

    if not self_pos == self.pan_to_position:
        self.movement_time_delta += delta
        if self.movement_time_delta > MAP_STEP:
            var diff_x = self.pan_to_position.x - self_pos.x
            var diff_y = self.pan_to_position.y - self_pos.y

            self.panning = self.__do_panning(diff_x, diff_y)
            if diff_x > -self.NEAR_THRESHOLD && diff_x < self.NEAR_THRESHOLD && diff_y > -self.NEAR_THRESHOLD && diff_y < self.NEAR_THRESHOLD:
                self.pan_to_position = self_pos
            else:
                self_pos.x = self_pos.x + diff_x * self.movement_time_delta;
                self_pos.y = self_pos.y + diff_y * self.movement_time_delta;
                var new_pos = Vector2(self_pos.x, self_pos.y)
                self.camera.set_offset(new_pos)
            self.movement_time_delta = 0
    else:
        self.panning = false

func __do_panning(diff_x, diff_y):
    if diff_x > -self.PAN_THRESHOLD && diff_x < self.PAN_THRESHOLD && diff_y > -self.PAN_THRESHOLD && diff_y < self.PAN_THRESHOLD:
        return false

    return true