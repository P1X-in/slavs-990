extends "res://scripts/services/abstract_screen.gd"

var play_button
var quit_button

func _init():
    self.screen_scene = preload("res://scenes/menu/main.tscn").instance()
    self.bind()

func bind():
    self.play_button = self.screen_scene.get_node('main/menu_container/play_button')
    self.quit_button = self.screen_scene.get_node('main/menu_container/quit_button')

    self.play_button.connect('pressed', self, '_play_button_pressed')
    self.quit_button.connect('pressed', self, '_quit_button_pressed')

func _play_button_pressed():
    self.detach()
    self.bag.board.attach()
    self.bag.action.load_game()

func _quit_button_pressed():
    OS.get_main_loop().quit()
