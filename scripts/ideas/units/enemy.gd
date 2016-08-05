var name
var family
var description
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

    self.player = player

func is_incapable():
    return false
