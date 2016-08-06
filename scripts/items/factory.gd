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
        for name in unit['loot'].keys():
            loot.append(self.generate(name, unit['loot'][name]))
    return loot

func generate(name, chance):
    randomize()
    var name = null
    var type = self.__get_item_type(name)

    if randf() <= chance:
        name = self.items_availability_table[type][randi() % self.items_availability_table[type].size()]
        return self.items[type].items[name]

    return null

func __get_item_type(name):
    for type in self.items.keys():
        if not self.items[type].items.keys().find('fur') == -1:
            return type

    return null


func __calculate_availability():
    var value
    for type in self.items:
        self.items_availability_table[type] = []
        value = 0
        for item in self.items[type].items:
            for i in range(0, self.items[type].items[item].availability):
                self.items_availability_table[type].append(item)

