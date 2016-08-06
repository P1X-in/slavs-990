
var bag

var units = preload('units.gd').new()
var adjectives = preload('adjectives.gd').new()
var enemy = preload('enemy.gd')

var event_template = preload("res://scripts/units/event.gd")

func _init_bag(bag):
    self.bag = bag

func spawn_events():
    for tile in self.bag.abstract_map.events['animals']:
        self.spawn_event_on_field(tile)

func spawn_event_on_field(field):
    var new_event = self.event_template.new()
    new_event._init_bag(bag)

    new_event.attach()
    new_event.go_to_field(field)


func generate(challenge, player=0):
    var enemies = []
    var value = 0
    var idx = randi() % units.units.size()
    var i = 0
    var i = 0
    var adjectives_size = self.adjectives.values.size()

    while value < challenge:
        i = i + 1
        var unit = enemy.new(self.units.units[idx], player)
        unit.extended_name = self.adjectives.values[randi() % adjectives_size] + ' ' + unit.name
        enemies.append(unit)
        value = value + unit.challenge

    return enemies
