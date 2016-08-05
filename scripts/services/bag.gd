var root

var file_handler = preload('res://scripts/services/file_handler.gd').new()
var processing = preload('res://scripts/services/processing.gd').new()
var timers = preload('res://scripts/services/timers.gd').new()
var input = preload("res://scripts/input/input.gd").new()
var intro = preload("res://scripts/services/intro.gd").new()
var sound = preload("res://scripts/controllers/sound_controller.gd").new()
var action = preload("res://scripts/controllers/action_controller.gd").new()
var menu = preload("res://scripts/menu/menu.gd").new()
var board = preload("res://scripts/services/board.gd").new()
var camera = preload("res://scripts/services/camera.gd").new()
var screens = preload("res://scripts/services/screens.gd").new()
var map = preload("res://scripts/services/map.gd").new()


func _init(root_node):
    self.root = root_node
    self.processing._init_bag(self, root_node)
    self.timers._init_bag(self, root_node)
    self.input._init_bag(self)
    self.intro._init_bag(self, root_node.mount)
    self.sound._init_bag(self, root_node)
    self.action._init_bag(self)
    self.menu._init_bag(self, root_node.mount)
    self.board._init_bag(self, root_node.mount)
    self.camera._init_bag(self)
    self.screens._init_bag(self)
    self.map._init_bag(self, self.board.map_mount)