extends "res://scripts/input/handlers/mouse_handler.gd"

var bag

func _init(bag):
    self.bag = bag
    self.type = InputEvent.MOUSE_MOTION

func handle(event):
    if self.bag.board.is_attached:
        self.bag.map.move_selector_to_screen_position(Vector2(event.x, event.y))

