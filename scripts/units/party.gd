
const MOVE_RANGE = 4

var party_scene = preload("res://scenes/entities/party.tscn").instance()
var inner_selector

var bag

var range_selector_template = preload('res://scenes/selector.tscn')
var current_range = {}
var current_tile
var selected = false

func _init():
    self.inner_selector = self.party_scene.get_node('selector')
    self.unselect()

func _init_bag(bag):
    self.bag = bag

func attach():
    self.bag.map.objects_mount.add_child(self.party_scene)

func set_map_pos(position):
    var global_position = self.bag.map.translate_map_to_global(position)

    self.party_scene.set_pos(global_position)
    self.current_tile = self.bag.abstract_map.get_field(position)
    self.current_tile.party = self

func go_to_field(field):
    self.set_map_pos(field.position)
    self.build_range(self.MOVE_RANGE)

func select():
    #self.inner_selector.show()
    self.build_range(self.MOVE_RANGE)
    self.selected = true

func unselect():
    self.inner_selector.hide()
    self.clear_range()
    self.selected = false

func build_range(move_range):
    self.clear_range()
    self.add_tile_with_neighbours(self.current_tile, move_range)

func add_tile_with_neighbours(tile, iteration):
    if self.current_range.has(tile.get_instance_ID()):
        return

    self.current_range[tile.get_instance_ID()] = self.range_selector_template.instance()
    self.bag.map.objects_mount.add_child(self.current_range[tile.get_instance_ID()])
    self.current_range[tile.get_instance_ID()].set_pos(self.bag.map.translate_map_to_global(tile.position))

    if iteration > 0:
        var nearby_tiles = tile.get_neighbours()
        for neighbour in nearby_tiles:
            self.add_tile_with_neighbours(neighbour, iteration - 1)

func clear_range():
    for tile in self.current_range:
        self.bag.map.objects_mount.remove_child(self.current_range[tile])
    self.current_range.clear()

func can_move_to(field):
    return self.current_range.has(field.get_instance_ID())