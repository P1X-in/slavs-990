var stack = []
var stack_size = []
var start_player = -1

func _init(units):
    self.stack.insert(0, [])
    self.stack.insert(1, [])

    var ordered = self.__sort_by_sequence(units)
    #reverse sort
    for unit in ordered:
        self.stack[unit.player].append(unit)

func prepare_match():
    if self.stack[0].size() > 0 and self.stack[1].size() > 0:
        return  self.match_opponents() + self.match_unpaired()

    return []

func match_opponents():
    var paired = min(self.stack[0].size(), self.stack[1].size())
    var matching = []

    var attacker = self.start_player
    var defender = (self.start_player + 1) % 2

    for i in range(0, paired):
        matching.append([ self.stack[attacker][i], self.stack[defender][i] ])

    return matching

func match_unpaired():
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
    for unit in self.stack[1]:
        if not unit.is_consious():
            self.stack[1].erase(unit)
    for unit in self.stack[1]:
        if not unit.is_consious():
            self.stack[1].erase(unit)

func __sort_by_sequence(units):
    var ordered = {}
    var result = []
    for unit in units:
        if not ordered.has(unit.sequence):
            ordered[unit.sequence] = []

        ordered[unit.sequence].append(unit)

    for sequence in ordered:

        for unit in ordered[sequence]:
            if self.start_player == -1:
                self.start_player = unit.player
            result.append(unit)

    return result

