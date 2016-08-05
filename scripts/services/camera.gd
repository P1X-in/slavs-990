
var bag

var camera
var zoom
var locked = false

const CAMERA_FIXED_Y = 132
const SNAP_THRESHOLD = 1

var pan_to_position

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
    return self.camera.get_pos()

func set_pos(position):
    self.camera.set_pos(position)

func pan_to(position):
    self.pan_to_position = position

func lock():
    self.locked = true
func unlock():
    self.locked = false

func process(delta):
    if self.locked:
        return