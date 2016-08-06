var units = {
    'wolf': {
        'name': 'wilk',
        'family' : 'wilki',
        'description': 'duże i gryzie',
        'hp': 20,
        'resistances' : {
            'normal' : {'threshold' : 2, 'resistance': 0.10}
            # 'slashing'
            # 'bludgeoning'
            # 'piercing'
        },
        'attacks' : {
            'bite' : {'damage' : 4, 'skill' : 0.20, 'critical': 0.02}
        },
        'loot' : {
            'jewelry' : 0.02,
            'fur' : 0.8,
            'meat': 0.2
        },
        'sequence' : 8,
        'challenge' : 3,
        'xp' : 10,
        'actions' : 1,
        'image' : 'res://assets/entities/animals/wilk.png',
        'entity' : 'animals/entity_wolf.tscn'
    }
}