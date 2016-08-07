extends "res://scripts/services/abstract_screen.gd"

var exit_button

func _init():
    self.screen_scene = preload("res://scenes/credits.tscn").instance()
    self.bind()

func bind():
    self.exit_button = self.screen_scene.get_node('panel/container/footer/exit_button')
    self.exit_button.connect('pressed', self, '_exit_button_pressed')


func _exit_button_pressed():
    self.go_back()

func go_back():
    self.detach()
    self.bag.menu.attach()
