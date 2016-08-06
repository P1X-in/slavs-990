var bag
var creatures = preload('types/creatures.gd').new()

var slavs = preload('types/slavs.gd').new()
var slavian_names = preload('slavian_names.gd').new()

var adjectives = preload('adjectives.gd').new()
var enemy = preload('enemy.gd')

var event_template = preload("res://scripts/units/event.gd")

func _init_bag(bag):
    self.bag = bag

func spawn_events():
    for tile in self.bag.abstract_map.events['animals']:
        self.spawn_event_on_field(tile, self.bag.abstract_map.TILE_FOREST_ANIMAL)
    for tile in self.bag.abstract_map.events['water']:
        self.spawn_event_on_field(tile, self.bag.abstract_map.TILE_WATER_CREATURE)
    for tile in self.bag.abstract_map.events['forest']:
        self.spawn_event_on_field(tile, self.bag.abstract_map.TILE_FOREST_CREATURE)

func spawn_event_on_field(field, type):
    var new_event = self.event_template.new()
    new_event._init_bag(bag)

    new_event.attach()
    new_event.go_to_field(field)

    if type == self.bag.abstract_map.TILE_FOREST_ANIMAL:
        new_event.animal_icon.show()
    if type == self.bag.abstract_map.TILE_WATER_CREATURE:
        new_event.water_icon.show()
    if type == self.bag.abstract_map.TILE_FOREST_CREATURE:
        new_event.forest_icon.show()

    new_event.units = self.generate(10)
    new_event.loot = self.bag.item_factory.generate_for_opponents(new_event.units)


func generate(challenge, player=0):
    randomize()
    var enemies = []
    var value = 0
    var idx = randi() % self.creatures.units.size()
    var i = 0
    var i = 0
    var adjectives_size = self.adjectives.values.size()

    while value < challenge:
        i = i + 1
        var unit = enemy.new(self.creatures.units[idx], player)
        unit.extended_name = self.adjectives.values[randi() % adjectives_size] + ' ' + unit.name
        enemies.append(unit)
        value = value + unit.challenge

    return enemies

func generate_party(player=0):
    randomize()
    var party = []
    var idx
    var names_size = self.slavian_names.male.size()

    for i in range(0, 5):
        idx = randi() % self.slavs.units.size()
        var unit = enemy.new(self.slavs.units[idx], player)
        unit.extended_name = unit.name + ' ' +self.slavian_names.male[randi() % names_size]
        party.append(unit)

    return party

