extends "res://scripts/services/abstract_screen.gd"

const TILE_SIZE = 64

var tilemap

var tiles = []
var selector = preload("res://scenes/selector.tscn").instance()

func _init():
    self.screen_scene = preload("res://scenes/map/map.tscn").instance()
    self.tilemap = self.screen_scene.get_node('types')
    self.register_main_scene = false
    self.screen_scene.add_child(self.selector)

func load_tiles():
    if self.tilemap.is_visible():
        self.tilemap.hide()

func translate_screen_to_map(position):
    var zoom = self.bag.camera.get_zoom()
    var half_screen_size = self.bag.root.get_size() / Vector2(2, 2)
    var map_click_pixel_position = (position + self.bag.camera.get_pos()) * zoom

    return self.tilemap.world_to_map(map_click_pixel_position)

func translate_map_to_global(position):
    var half_screen_size = self.bag.root.get_size() / Vector2(2, 2)
    return self.tilemap.map_to_world(position) - half_screen_size

func move_selector_to_screen_position(position):
    var half_screen_size = self.bag.root.get_size() / Vector2(2, 2)
    var map_position = self.translate_screen_to_map(position)
    var global_map_position = self.translate_map_to_global(map_position) + half_screen_size

    self.selector.set_pos(global_map_position)

