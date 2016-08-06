extends "res://scripts/services/abstract_screen.gd"

var map_mount

func _init():
    self.screen_scene = preload("res://scenes/board.tscn").instance()
    self.map_mount = self.screen_scene.get_node('viewport/map_mount')

func attach():
    .attach()
    self.bag.camera.attach()

func detach():
    .detach()
    self.bag.camera.detach()

func go_back():
    self.detach()
    self.bag.menu.attach()

func load_map():
    self.bag.map.attach()