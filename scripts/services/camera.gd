
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


func _init_bag(bag):
    self.bag = bag
    self.camera = self.bag.board.screen_scene.get_node('viewport/camera')
    self.zoom = self.camera.get_zoom()

func attach():
    self.bag.processing.register(self)
    self.camera.make_current()

func detach():
    self.bag.processing.remove(self)

func get_pos():
    return self.camera.get_offset()

func set_pos(position):
    self.pan_to_position = position
    self.camera.set_offset(position)

func pan_to(position):
    self.game_size = self.bag.root.get_size()
    self.update_zoom()

    var self_pos = self.get_pos()
    var target_position = self.bag.map.tilemap.map_to_world(position)
    var diff_x = target_position.x - self_pos.x
    var diff_y = target_position.y - self_pos.y
    var near_x = self.game_size.x * (self.NEAR_SCREEN_THRESHOLD * self.scale.x)
    var near_y = self.game_size.y * (self.NEAR_SCREEN_THRESHOLD * self.scale.y)

    if diff_x > -near_x && diff_x < near_x && diff_y > -near_y && diff_y < near_y:
        return

    self.panning = true
    self.pan_to_position = position

func update_zoom():
    self.scale = self.camera.get_zoom()

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