var stack = []
var stack_size = []
var start_player = -1

func _init(units):
    self.stack.insert(0, [])
    self.stack.insert(1, [])

    for unit in units:
        unit.prepare_fight_sequence()

    units.sort_custom(self, '__sort_sequence')
    self.start_player = units[0].player

    for unit in units:
        self.stack[unit.player].append(unit)

func prepare_match():
    return  self.__match_opponents() + self.__match_unpaired()

func check_winner():
    if self.stack[0].size() == 0:
        return 1

    elif self.stack[1].size() == 0:
        return 0

    return -1

func __match_opponents():
    var paired = min(self.stack[0].size(), self.stack[1].size())
    var matching = []

    var attacker = self.start_player
    var defender = (self.start_player + 1) % 2

    for i in range(0, paired):
        matching.append([ self.stack[attacker][i], self.stack[defender][i] ])

    return matching

func __match_unpaired():
    var attacker = 0
    var defender = 1
    var stack0_size = self.stack[0].size()
    var stack1_size = self.stack[1].size()

    if stack0_size == stack1_size:
        return []

    if stack0_size < stack1_size:
        attacker = 1
        defender = 0

    var all = max(stack0_size, stack1_size)
    var paired = min(stack0_size, stack1_size)
    var result = []
    var rand

    for i in range(paired, all):
        rand = randi() % paired
        result.append([ self.stack[attacker][i], self.stack[defender][rand] ])

    return result

func remove_unconsious():
    for unit in self.stack[0]:
        if not unit.is_consious():
            self.stack[0].erase(unit)
    for unit in self.stack[1]:
        if not unit.is_consious():
            self.stack[1].erase(unit)

func __sort_sequence(unit1, unit2):
    if unit1.fight_sequence > unit2.fight_sequence:
        return true
    return false

