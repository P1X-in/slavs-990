var stack = []
var stack_size = []
var start_player = -1

func _init(units):
    self.stack.insert(0, [])
    self.stack.insert(1, [])
    self.stack_size.insert(0, 0)
    self.stack_size.insert(1, 0)


    var ordered = self.__sort_by_sequence(units)
    #reverse sort
    for unit in ordered:
        self.stack[unit.player].append(unit)
        self.stack_size[unit.player] = self.stack_size[unit.player] + 1

func prepare_match():
    return self.match_opponents() + self.match_unpaired()

func match_opponents():
    var paired = min(self.stack_size[0], self.stack_size[1])
    var matching = []

    var attacker = self.start_player
    var defender = (self.start_player + 1) % 2

    for i in range(0, paired):
        matching.append([ self.stack[attacker][i], self.stack[defender][i] ])

    return matching

func match_unpaired():
    var attacker = 0
    var defender = 1
    if self.stack_size[0] == self.stack_size[1]:
        return []

    if self.stack_size[0] < self.stack_size[1]:
        attacker = 1
        defender = 0

    var all = max(self.stack_size[0], self.stack_size[1])
    var paired = min(self.stack_size[0], self.stack_size[1])
    var result = []
    var rand

    for i in range(paired, all):
        rand = randi() % paired
        result.append([ self.stack[attacker][i], self.stack[defender][rand] ])

    return result


func remove_incapable():
    for player in stack:
        for unit in stack[player]:
            if unit.is_incapable():
                stack[player].erase(unit)

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

