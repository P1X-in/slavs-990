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
    var loot = {}
    for unit in units:
        for name in unit['loot'].keys():
            randomize()
            if randf() <= unit['loot'][name]:
                if loot.has(name):
                    loot[name] = loot[name] + 1
                else:
                    loot[name] = 1

    return loot

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

