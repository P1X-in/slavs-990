
const TILE_VILLAGE = 1
const TILE_START = 5
const TILE_FOREST_ANIMAL = 4
const TILE_WATER_CREATURE = 3
const TILE_FOREST_CREATURE = 6

var bag

var size = Vector2(0, 0)
var fields = [[null]]

var events = {
	'animals' : [],
	'water' : [],
	'forest' : []
}

var tilemap
var field_template = preload('res://scripts/services/abstract_field.gd')

const MAX_MAP_DIMENSION = 100

var village_tile = null
var start_tile = null

func _init_bag(bag):
	self.bag = bag
	self.tilemap = self.bag.map.tilemap
	self.extend(Vector2(self.MAX_MAP_DIMENSION, self.MAX_MAP_DIMENSION))

func reset():
	self.size = Vector2(0, 0)
	self.fields = [[null]]
	self.village_tile = null
	self.start_tile = null
	self.events = {
		'animals' : [],
		'water' : [],
		'forest' : []
	}

func get_field(position):
	if position.x < 0 || position.y < 0:
		return self.create_field(Vector2(-1, -1))

	if fields[0][0] == null:
		fields[0][0] = self.create_field(Vector2(0, 0))

	if (position.x > size.x || position.y > size.y):
		self.extend(position)
	return fields[position.y][position.x]

func extend(position):
	var row
	var field
	#extend existing rows
	for i in range(size.y + 1):
		row = fields[i]
		for j in range(position.x - size.x):
			row.insert(size.x + j + 1, self.create_field(Vector2(size.x + j + 1, i)))

	#add new rows
	var width = position.x
	if size.x > width:
		width = size.x

	for i in range(position.y - size.y):
		row = []
		for j in range(width + 1):
			row.insert(j, self.create_field(Vector2(j, size.y + i + 1)))
		fields.insert(size.y + i + 1, row)

	if position.x > size.x:
		size.x = position.x
	if position.y > size.y:
		size.y = position.y

func create_field(position):
	var field = self.field_template.new()
	field.position = position
	field.terrain_type = self.tilemap.get_cell(position.x, position.y)
	field.abstract_map = self

	if field.terrain_type == self.TILE_VILLAGE:
		self.village_tile = field
	if field.terrain_type == self.TILE_START:
		self.start_tile = field
		self.tilemap.set_cell(position.x, position.y, -1)
		field.terrain_type = -1

	if field.terrain_type == self.TILE_FOREST_ANIMAL:
		self.events['animals'].append(field)
		self.tilemap.set_cell(position.x, position.y, -1)
		field.terrain_type = -1
	if field.terrain_type == self.TILE_WATER_CREATURE:
		self.events['water'].append(field)
		self.tilemap.set_cell(position.x, position.y, -1)
		field.terrain_type = -1
	if field.terrain_type == self.TILE_FOREST_CREATURE:
		self.events['forest'].append(field)
		self.tilemap.set_cell(position.x, position.y, -1)
		field.terrain_type = -1


	return field
