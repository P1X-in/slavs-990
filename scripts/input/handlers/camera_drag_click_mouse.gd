extends "res://scripts/input/handlers/mouse_handler.gd"

var bag

func _init(bag):
    self.bag = bag
    self.type = InputEvent.MOUSE_BUTTON
    self.button_index = BUTTON_LEFT

func handle(event):
    if self.bag.board.is_attached:
        self.bag.camera.dragging = event.is_pressed()
