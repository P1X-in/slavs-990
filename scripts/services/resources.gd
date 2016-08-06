var resources = {}

func _init():
    var materials = preload('res://scripts/items/types/materials.gd').new().items
    for material in materials:
        self.resources[material] = 0

func add(name, quantity):
    self.resources[name] = self.resources[name] + quantity

func has(name, quantity):
    if self.resources.has(name) and self.resources[name] >= quantity:
        return true
    return false

func use(name, quantity):
    self.resources[name] = self.resources[name] - quantity


