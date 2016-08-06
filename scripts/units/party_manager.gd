extends "res://scripts/services/abstract_screen.gd"

func _init():
    self.screen_scene = preload("res://scenes/map/party.tscn").instance()

func go_back():
    self.detach()
    self.bag.board.attach()
