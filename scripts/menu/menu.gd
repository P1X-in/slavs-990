extends "res://scripts/services/abstract_screen.gd"

func _init():
    self.screen_scene = preload("res://scenes/menu/main.tscn").instance()
