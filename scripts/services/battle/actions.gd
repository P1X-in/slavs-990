var unit_actions = {}

func prepare_for_units(units):
    self.unit_actions.clear()
    for unit in units:
        self.unit_actions[unit.get_instance_ID()] = 0

func reset():
    for id in self.unit_actions:
        self.unit_actions[id] = 0

func use_actions(unit, actions=1):
    var id = unit.get_instance_ID()
    self.unit_actions[id] = self.unit_actions[id] + actions

func has_actions(unit):
    return self.unit_actions[unit.get_instance_ID()] < unit.actions