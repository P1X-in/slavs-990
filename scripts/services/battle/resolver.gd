var battle_stack
var battle_log
var bag

func _init():
    battle_stack = preload("res://scripts/services/battle/stack.gd")

func _init_bag(bag):
    self.bag = bag

func resolve_fight(units):
    var stack = self.battle_stack.new(units)
    self.bag.battle_actions.prepare_for_units(units)
    var match
    while stack.check_winner() == -1:
        match = stack.prepare_match()
        self.__resolve_turn(match)
        stack.remove_unconsious()
        self.bag.battle_actions.reset()

    self.bag.battle_log.fight_ends(stack.check_winner())

    return stack.check_winner()

func __resolve_turn(stack):
    self.bag.battle_log.new_turn()
    for units in stack:
        self.bag.battle_log.attacks(units[0], units[1])
        self.__make_attack(units[0], units[1])
        if units[1].is_consious() and self.bag.battle_actions.has_actions(units[1]):
            self.bag.battle_log.attacks(units[1], units[0])
            self.__make_attack(units[1], units[0])

func __make_attack(attacker, defender):
    randomize()
    self.bag.battle_actions.use_actions(attacker)

    var attack_type = attacker['attacks'].keys()[randi() % attacker['attacks'].size()]
    var attack = attacker['attacks'][attack_type]
    var critical = false
    if randf() <= attack['skill']:
        randomize()
        var damage = randi() % attack['damage'] + 1
        if randf() <= attack['critical']:
            damage = damage + damage

        var defence_type = defender['resistances']['normal']
        damage = damage - defence_type['threshold']
        damage = damage - damage * defence_type['resistance']
        damage = ceil(damage)

        if damage < 0:
            damage = 0

        defender.hp = defender.hp - damage

        self.bag.battle_log.deals_damage(attacker, defender, damage, critical)
    else:
        self.bag.battle_log.misses()







