extends "res://scripts/services/abstract_screen.gd"

var map_mount

var current_map = null

func _init():
    self.screen_scene = preload("res://scenes/board.tscn").instance()
    self.map_mount = self.screen_scene.get_node('viewport/map_mount')

func go_back():
    self.detach()
    self.bag.menu.attach()

func load_map():
    self.bag.map.attach()