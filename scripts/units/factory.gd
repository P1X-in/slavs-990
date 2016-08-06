var bag
var units = {
    'animals' : preload('types/animals.gd').new().units,
    'monsters' : preload('types/monsters.gd').new().units,
    'slavs' : preload('types/slavs.gd').new().units
}

var slavian_names = preload('slavian_names.gd').new()

var adjectives = preload('adjectives.gd').new()
var enemy = preload('enemy.gd')

var event_template = preload("res://scripts/units/event.gd")

func _init_bag(bag):
    self.bag = bag

func spawn_events():
    self.bag.party.units = self.generate_party()

    for tile in self.bag.abstract_map.events['animals']:
        self.spawn_event_on_field(tile, self.bag.abstract_map.TILE_FOREST_ANIMAL)
    for tile in self.bag.abstract_map.events['water']:
        self.spawn_event_on_field(tile, self.bag.abstract_map.TILE_WATER_CREATURE)
    for tile in self.bag.abstract_map.events['forest']:
        self.spawn_event_on_field(tile, self.bag.abstract_map.TILE_FOREST_CREATURE)

func spawn_event_on_field(field, type):
    randomize()
    var new_event = self.event_template.new()
    new_event._init_bag(bag)

    new_event.attach()
    new_event.go_to_field(field)

    if type == self.bag.abstract_map.TILE_FOREST_ANIMAL:
        new_event.animal_icon.show()
        new_event.units = self.generate_units('animals', 'wolf', randi() % 10)
    if type == self.bag.abstract_map.TILE_WATER_CREATURE:
        new_event.water_icon.show()
        new_event.units = self.generate_units('monsters', 'rat', randi() % 4)
    if type == self.bag.abstract_map.TILE_FOREST_CREATURE:
        new_event.forest_icon.show()
        new_event.units = self.generate_units('monsters', 'rat', randi() % 2)

    new_event.loot = self.bag.item_factory.generate_for_opponents(new_event.units)


func generate(challenge, player=0, type='animals'):
    randomize()
    var enemies = []
    var value = 0
    var name =  self.units[type].keys()[randi() % self.units[type].size()]
    var adjectives_size = self.adjectives.values.size()

    while value < challenge:
        var unit = enemy.new(self.units[type][name], player)
        unit.extended_name = self.adjectives.values[randi() % adjectives_size] + ' ' + unit.name
        enemies.append(unit)
        value = value + unit.challenge

    return enemies

func generate_party(player=0):
    randomize()
    var party = []
    var name
    var names_size = self.slavian_names.male.size()
    var unit_type_size = self.units['slavs'].size()

    for i in range(0, 5):
        name = self.units['slavs'].keys()[randi() % unit_type_size]

        var unit = enemy.new(self.units['slavs'][name], player)
        unit.extended_name = unit.name + ' ' +self.slavian_names.male[randi() % names_size]
        party.append(unit)

    return party

func generate_units(unit_type, unit_name, player=0, quantity=1):
    var enemies = []
    var unit
    var adjectives_size = self.adjectives.values.size()
    var params = self.units[unit_type][unit_name]
    for i in range(0, quantity):
        unit = enemy.new(params, player)
        unit.extended_name = self.adjectives.values[randi() % adjectives_size] + ' ' + unit.name
        enemies.append(unit)

    return unit

