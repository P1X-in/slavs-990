extends "res://scripts/input/handlers/mouse_handler.gd"

var bag

var max_zoom = Vector2(2.0, 2.0)
var zoom_step = Vector2(0.1, 0.1)

func _init(bag):
    self.bag = bag
    self.type = InputEvent.MOUSE_BUTTON
    self.button_index = BUTTON_WHEEL_DOWN

func handle(event):
    if self.bag.board.is_attached and event.is_pressed():
        var zoom = self.bag.camera.get_zoom()

        zoom = zoom + self.zoom_step
        if zoom > self.max_zoom:
            zoom = self.max_zoom

        self.bag.camera.set_zoom(zoom)
