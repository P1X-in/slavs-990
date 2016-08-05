extends "res://scripts/services/abstract_screen.gd"

var is_detached = false

func _init():
    self.screen_scene = preload("res://scenes/intro.tscn").instance()

func attach():
    .attach()
    self.is_detached = false

func detach():
    self.is_detached = true
    .detach()
