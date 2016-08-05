var logs = []

func clear():
    self.logs.clear()

func show():
    for text in self.logs:
        print(text)

func attacks(attacker, defender):
    logs.append(attacker.extended_name + ' atakuje ' + defender.extended_name)

func misses():
    logs.append('..i chybia')

func deals_damage(attacker, defender, damage, critical):
    var text = '..i zadaje ' + str(damage) + ' ptk obrażeń'
    if not defender.is_consious():
        text = text +'; Przeciwnik pada'
    logs.append(text)

func fight_ends(winner):
    if winner == 0:
        logs.append('Wygrałeś!')
    else:
        logs.append('Przegrałeś!')

func new_turn():
    logs.append('-- NOWA TURA --')