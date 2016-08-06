var items = {}
var items_availability_table = {}

func _init():
    self.items = {
        'weapons' : preload('types/weapons.gd').new(),
        'materials' : preload('types/materials.gd').new(),
        'jewelry' : preload('types/jewelry.gd').new()
    }
    self.__calculate_availability()

func generate_for_opponents(units):
    var loot = []
    for unit in units:
        for type in unit['loot'].keys():
            loot.append(self.generate(type, unit['loot'][type]))
    return loot

func generate(type, chance):
    randomize()
    var name = null
    if randf() <= chance:
        name = self.items_availability_table[type][randi() % self.items_availability_table[type].size()]
        return self.items[type].items[name]

    return null

func __calculate_availability():
    var value
    for type in self.items:
        self.items_availability_table[type] = []
        value = 0
        for item in self.items[type].items:
            for i in range(0, self.items[type].items[item].availability):
                self.items_availability_table[type].append(item)

