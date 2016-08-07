
const MOVE_RANGE = 8

var party_scene = preload("res://scenes/entities/party.tscn").instance()
var inner_selector
var party_avatar

var bag

var range_selector_template = preload('res://scenes/selector.tscn')
var current_range = {}
var current_tile
var selected = false

var units

func _init():
    self.inner_selector = self.party_scene.get_node('selector')
    self.party_avatar = self.party_scene.get_node('slav1/slav')
    self.unselect()

func _init_bag(bag):
    self.bag = bag

func attach():
    self.bag.map.objects_mount.add_child(self.party_scene)

func set_map_pos(position):
    var global_position = self.bag.map.translate_map_to_global(position)

    self.party_scene.set_pos(global_position)
    if self.current_tile:
        self.current_tile.party = null
        if position.x < self.current_tile.position.x:
            self.party_avatar.set_flip_h(true)
        if position.x > self.current_tile.position.x:
            self.party_avatar.set_flip_h(false)

    self.current_tile = self.bag.abstract_map.get_field(position)
    self.current_tile.party = self

func go_to_field(field):
    self.set_map_pos(field.position)
    self.build_range(self.MOVE_RANGE)
    self.bag.abstract_map.reveal_events(field)

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

    var tiles_to_process = [];
    var i = 0
    var tile
    tiles_to_process.append([self.current_tile, 0])

    while i < tiles_to_process.size():
        tile = tiles_to_process[i][0]
        if not self.current_range.has(tile.get_instance_ID()) and tile.is_passable():
            self.current_range[tile.get_instance_ID()] = self.range_selector_template.instance()
            self.bag.map.objects_mount.add_child(self.current_range[tile.get_instance_ID()])
            self.current_range[tile.get_instance_ID()].set_pos(self.bag.map.translate_map_to_global(tile.position))
            self.current_range[tile.get_instance_ID()].set_frame(1)

            if tiles_to_process[i][1] < move_range:
                for neighbour in tile.get_neighbours():
                    tiles_to_process.append([neighbour, tiles_to_process[i][1] + 1])
        i = i + 1

func clear_range():
    for tile in self.current_range:
        self.bag.map.objects_mount.remove_child(self.current_range[tile])
    self.current_range.clear()

func can_move_to(field):
    return self.current_range.has(field.get_instance_ID())