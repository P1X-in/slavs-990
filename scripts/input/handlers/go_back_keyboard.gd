extends "res://scripts/input/handlers/keyboard_handler.gd"

var bag

func _init(bag):
    self.bag = bag
    self.scancode = KEY_ESCAPE

func handle(event):
    if event.is_pressed() and not event.is_echo():
        self.bag.screens.go_back()