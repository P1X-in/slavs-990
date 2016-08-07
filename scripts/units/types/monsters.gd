var units = {
    'rat': {
        'name': 'szczur',
        'family' : 'szczury',
        'description': 'małe i gryzie',
        'hp': 10,
        'resistances' : {
            'normal' : {'threshold' : 0, 'resistance': 0.10}
            # 'slashing'
            # 'bludgeoning'
            # 'piercing'
        },
        'attacks' : {
            'bite' : {'damage' : 4, 'skill' : 0.20, 'critical': 0.02}
        },
        'loot' : {
        },
        'sequence' : 6,
        'challenge' : 1,
        'xp' : 10,
        'actions' : 1,
        'image' : '--',
        'entity' : '--'
    },
    'borowy': {
        'name': 'borowy',
        'family' : 'borowe',
        'description': 'małe i gryzie',
        'hp': 12,
        'resistances' : {
            'normal' : {'threshold' : 1, 'resistance': 0.20}
            # 'slashing'
            # 'bludgeoning'
            # 'piercing'
        },
        'attacks' : {
            'bite' : {'damage' : 4, 'skill' : 0.30, 'critical': 0.02}
        },
        'loot' : {
            'wood' : 0.99
        },
        'sequence' : 2,
        'challenge' : 1,
        'xp' : 10,
        'actions' : 1,
        'image' : 'res://assets/entities/creatures/borowy.png',
        'entity' : 'creatures/borowy.tscn'
    },
    'cmuch': {
        'name': 'cmoch',
        'family' : 'cmuchy',
        'description': 'małe i gryzie',
        'hp': 8,
        'resistances' : {
            'normal' : {'threshold' : 0, 'resistance': 0.10}
            # 'slashing'
            # 'bludgeoning'
            # 'piercing'
        },
        'attacks' : {
            'bite' : {'damage' : 1, 'skill' : 0.20, 'critical': 0.1}
        },
        'loot' : {
            'fur' : 0.2
        },
        'sequence' : 6,
        'challenge' : 1,
        'xp' : 10,
        'actions' : 1,
        'image' : 'res://assets/entities/creatures/cmuch.png',
        'entity' : 'creatures/cmuch.tscn'
    }
}