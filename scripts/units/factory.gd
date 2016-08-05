var units = preload('units.gd').new()
var enemy = preload('enemy.gd')

func generate(challenge, player=0):
    var enemies = []
    var value = 0
    var idx = randi() % units.units.size()
    var i = 0

    while value < challenge:
        i = i + 1
        var unit = enemy.new(self.units.units[idx], player)

        var mod = randi() % 5
        unit.sequence = unit.sequence + mod
        unit.name = unit.name + '#' + str(i)
        enemies.append(unit)
        value = value + unit.challenge

    return enemies
