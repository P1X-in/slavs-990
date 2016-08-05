var battle_stack
var battle_log
var bag

func _init():
    battle_stack = preload("res://scripts/services/battle_stack.gd")

func _init_bag(bag):
    self.bag = bag

func resolve_fight(units):
    var stack = self.battle_stack.new(units)
    var match = stack.prepare_match()
    while match.size() > 0:
        self.__resolve_turn(match)
        stack.remove_unconsious()

        match = stack.prepare_match()

func __resolve_turn(stack):
    self.bag.battle_log.new_turn()
    for units in stack:
        self.bag.battle_log.attacks(units[0], units[1])
        self.__make_attack(units[0], units[1])
        if units[1].is_consious():
            self.bag.battle_log.attacks(units[1], units[0])
            self.__make_attack(units[1], units[0])

func __make_attack(attacker, defender):
    randomize()
    var attack_type = attacker['attacks'].keys()[randi() % attacker['attacks'].size()]
    var attack = attacker['attacks'][attack_type]
    var critical = false
    if randf() <= attack['skill']:
        var damage = attack['damage']
        if randf() <= attack['critical']:
            damage = damage + damage

        var defence_type = defender['resistances']['normal']
        damage = damage - defence_type['threshold']
        damage = damage - defence_type['resistance']
        damage = ceil(damage)
        defender.hp = defender.hp - damage

        self.bag.battle_log.deals_damage(attacker, defender, damage, critical)
    else:
        self.bag.battle_log.misses()







