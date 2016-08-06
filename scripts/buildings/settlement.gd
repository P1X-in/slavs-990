extends "res://scripts/services/abstract_screen.gd"

func _init():
    self.screen_scene = preload("res://scenes/map/settlement.tscn").instance()


func go_back():
    self.detach()
    self.bag.board.attach()
