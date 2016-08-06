extends "res://scripts/input/handlers/mouse_handler.gd"

var bag

func _init(bag):
    self.bag = bag
    self.type = InputEvent.MOUSE_BUTTON
    self.button_index = BUTTON_LEFT

func handle(event):
    if self.bag.board.is_attached and event.is_pressed():
        self.bag.action.handle_screen_click(Vector2(event.x, event.y))
