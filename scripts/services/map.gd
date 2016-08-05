extends "res://scripts/services/abstract_screen.gd"

func _init():
    self.screen_scene = preload("res://scenes/map/map.tscn").instance()
    self.register_main_scene = false
