extends "res://scripts/services/abstract_screen.gd"

const TILE_SIZE = 64

var tilemap

var tiles = []

func _init():
    self.screen_scene = preload("res://scenes/map/map.tscn").instance()
    self.tilemap = self.screen_scene.get_node('types')
    self.register_main_scene = false

func load_tiles():
    if self.tilemap.is_visible():
        self.tilemap.hide()

func translate_screen_to_map(position):
    var half_screen_size = self.bag.root.get_size() / Vector2(2, 2)
    var map_click_pixel_position = position - half_screen_size + self.bag.camera.get_pos()

    return self.tilemap.world_to_map(map_click_pixel_position)

func translate_map_to_global(position):
    var half_screen_size = self.bag.root.get_size() / Vector2(2, 2)
    return self.tilemap.map_to_world(position) - half_screen_size

