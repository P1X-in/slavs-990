var name
var extended_name
var family
var description
var max_hp
var hp
var ap
var resistances = {}
var attacks = {}
var challenge
var xp

var status
var sequence = 1
var player = 0

var params = ['name', 'family', 'description', 'hp', 'ap', 'resistances', 'attacks', 'challenge', 'xp']

func _init(params, player=0):
    for param in self.params:
        self.set(param, params[param])

    self.max_hp = self.hp
    self.player = player

func is_consious():
    return hp > 0
