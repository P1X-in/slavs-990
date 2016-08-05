extends "res://scripts/input/handlers/keyboard_handler.gd"

var bag

func _init(bag):
    self.bag = bag
    self.scancode = null

func handle(event):
    if not self.bag.intro.is_detached:
        self.bag.intro.detach()