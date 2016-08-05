extends "res://scripts/input/handlers/mouse_handler.gd"

var bag

func _init(bag):
    self.bag = bag
    self.type = InputEvent.MOUSE_BUTTON
    self.button_index = BUTTON_LEFT

func handle(event):
    if not self.bag.intro.is_detached:
        self.bag.intro.detach()
        self.bag.menu.attach()
