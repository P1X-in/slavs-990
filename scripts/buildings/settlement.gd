extends "res://scripts/services/abstract_screen.gd"

var back_button

func _init():
    self.screen_scene = preload("res://scenes/map/settlement.tscn").instance()
    self.bind()

func bind():
    self.back_button = self.screen_scene.get_node('panel/container/HBoxContainer/Button3')
    self.back_button.connect('pressed', self, '_back_button_pressed')

func go_back():
    self.detach()
    self.bag.board.attach()

func _back_button_pressed():
    self.go_back()
