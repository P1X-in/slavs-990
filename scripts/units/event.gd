
var event_scene = preload("res://scenes/entities/event.tscn").instance()

var bag

var current_tile = null

func _init_bag(bag):
    self.bag = bag


func attach():
    self.bag.map.objects_mount.add_child(self.party_scene)


func set_map_pos(position):
    var global_position = self.bag.map.translate_map_to_global(position)

    self.event_scene.set_pos(global_position)
    if self.current_tile:
        self.current_tile.event = null
    self.current_tile = self.bag.abstract_map.get_field(position)
    self.current_tile.event = self

func go_to_field(field):
    self.set_map_pos(field.position)