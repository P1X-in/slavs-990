var resources = {}

func add(name, quantity):
    if not self.resources.has(name):
        self.resources[name] = quantity
    else:
        self.resources[name] = self.resources[name] + quantity

func has(name, quantity):
    if self.resources.has(name) and self.resources[name] >= quantity:
        return true
    return false

func use(name, quantity):
    self.resources[name] = self.resources[name] - quantity


