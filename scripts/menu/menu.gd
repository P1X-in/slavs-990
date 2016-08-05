extends "res://scripts/services/abstract_screen.gd"

var play_button
var quit_button

func _init():
    self.screen_scene = preload("res://scenes/menu/main.tscn").instance()
    self.bind()

func bind():
    self.play_button = self.screen_scene.get_node('play_button')
    self.quit_button = self.screen_scene.get_node('quit_button')

    self.quit_button.connect('pressed', self, '_quit_button_pressed')

func _quit_button_pressed():
    OS.get_main_loop().quit()
