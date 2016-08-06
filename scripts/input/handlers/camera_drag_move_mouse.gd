extends "res://scripts/input/handlers/mouse_handler.gd"

var bag

func _init(bag):
    self.bag = bag
    self.type = InputEvent.MOUSE_MOTION

func handle(event):
    if self.bag.camera.dragging:
        var relative_position = -Vector2(event.relative_x, event.relative_y) * self.bag.camera.zoom
        self.bag.camera.offset_camera(relative_position)
