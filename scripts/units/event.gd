
var event_scene = preload("res://scenes/entities/event.tscn").instance()

var bag

var animal_icon
var water_icon
var forest_icon

var current_tile = null

var units = null
var loot = null
var enemy_icon_type

func _init_bag(bag):
    self.bag = bag
    self.animal_icon = self.event_scene.get_node('animals')
    self.water_icon = self.event_scene.get_node('water')
    self.forest_icon = self.event_scene.get_node('forest')

func attach():
    self.bag.map.objects_mount.add_child(self.event_scene)
    self.event_scene.hide()

func remove():
    self.bag.map.objects_mount.remove_child(self.event_scene)
    self.current_tile.event = null

func reveal():
    self.event_scene.show()

func set_map_pos(position):
    var global_position = self.bag.map.translate_map_to_global(position)

    self.event_scene.set_pos(global_position)
    if self.current_tile:
        self.current_tile.event = null
    self.current_tile = self.bag.abstract_map.get_field(position)
    self.current_tile.event = self

func go_to_field(field):
    self.set_map_pos(field.position)

func randomize_animation():
    randomize()
    var time_seed = randi() % 5
    self.animal_icon.get_node('anim').seek(time_seed * 0.1, true)
    self.water_icon.get_node('anim').seek(time_seed * 0.1, true)
    self.forest_icon.get_node('anim').seek(time_seed * 0.1, true)