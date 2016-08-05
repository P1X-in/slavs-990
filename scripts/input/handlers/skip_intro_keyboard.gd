extends "res://scripts/input/handlers/keyboard_handler.gd"

var bag

func _init(bag):
    self.bag = bag
    self.scancode = null

func handle(event):
    if not self.bag.intro.is_detached:
        self.bag.intro.detach()
        self.bag.timers.set_timeout(0.1, self.bag.menu, 'attach')