var terrain_type
var position
var object = null
var party = null
var event = null
var abstract_map = null

func is_adjacent(field):
    var diff_x = self.position.x - field.position.x
    var diff_y = self.position.y - field.position.y
    if diff_x < 0:
        diff_x = -diff_x
    if diff_y < 0:
        diff_y = -diff_y
    if diff_x + diff_y == 1:
        return true
    return false

func is_settlement():
    if self.terrain_type == self.abstract_map.TILE_VILLAGE:
        return true

    return false

func is_passable():
    if self.terrain_type != -1:
        return false
    if self.object != null:
        return false

    return true

func has_attackable_enemy(unit):
    if unit == null:
        return false

    if self.object != null and self.object.group == 'unit' and self.object.player != unit.player:
        if unit.can_attack() and unit.can_attack_unit_type(self.object):
            return true

    return false

func has_capturable_building(unit):
    if unit == null:
        return false

    if self.object != null and self.object.group == 'building' and self.object.player != unit.player:
        if unit.can_capture_building(self.object):
            return true

    return false

func get_neighbours():
    return [
        self.abstract_map.get_field(self.position + Vector2(0, -1)),
        self.abstract_map.get_field(self.position + Vector2(0, 1)),
        self.abstract_map.get_field(self.position + Vector2(-1, 0)),
        self.abstract_map.get_field(self.position + Vector2(1, 0))
    ]

func get_distance_factor(field):
    var diff_x = abs(self.position.x - field.position.x)
    var diff_y = abs(self.position.y - field.position.y)

    return diff_x * diff_x + diff_y * diff_y
