var name
var extended_name
var family
var description
var max_hp
var hp
var ap
var resistances = {}
var attacks = {}
var loot = {}
var challenge
var xp
var actions

var status
var sequence = 1
var fight_sequence = 1
var player = 0

var params = ['name', 'family', 'description', 'hp','resistances', 'attacks', 'challenge', 'xp', 'loot', 'sequence', 'actions']

func _init(params, player=0):
    for param in self.params:
        self.set(param, params[param])

    self.max_hp = self.hp
    self.player = player
    self.fight_sequence = self.sequence

func is_consious():
    return hp > 0

func prepare_fight_sequence():
    randomize()
    self.fight_sequence = randi() % self.sequence + 1


