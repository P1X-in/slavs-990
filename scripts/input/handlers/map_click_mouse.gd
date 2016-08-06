extends "res://scripts/input/handlers/mouse_handler.gd"

const CLICK_THRESHOLD = 10

var bag

var click_location = Vector2(0, 0);

func _init(bag):
    self.bag = bag
    self.type = InputEvent.MOUSE_BUTTON
    self.button_index = BUTTON_LEFT

func handle(event):
    if self.bag.board.is_attached:
        if event.is_pressed():
            self.click_location.x = event.x
            self.click_location.y = event.y
        else:
            if abs(event.x - self.click_location.x) < self.CLICK_THRESHOLD or abs(event.y - self.click_location.y) < self.CLICK_THRESHOLD:
                self.bag.action.handle_screen_click(Vector2(event.x, event.y))
