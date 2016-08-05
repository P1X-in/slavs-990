extends "res://scripts/services/abstract_screen.gd"

var tilemap

var tiles = []

func _init():
    self.screen_scene = preload("res://scenes/map/map.tscn").instance()
    self.tilemap = self.screen_scene.get_node('tiles')
    self.register_main_scene = false

func load_tiles():
    return
