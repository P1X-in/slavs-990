var units = {
    'wolf': {
        'name': 'wilk',
        'family' : 'wilki',
        'description': 'duże i gryzie',
        'hp': 5,
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
            'fur' : 0.7,
            'meat': 0.5
        },
        'sequence' : 8,
        'challenge' : 3,
        'xp' : 10,
        'actions' : 1,
        'image' : 'res://assets/entities/animals/wilk.png',
        'entity' : 'animals/entity_wolf.tscn'
    }
}