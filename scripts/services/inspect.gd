extends "res://scripts/services/abstract_screen.gd"

var exit_button

var name_label

var wolf_avatar
var wolf_description

var cmuch_avatar
var cmuch_description

var borowy_avatar
var borowy_description

func _init():
    self.screen_scene = preload("res://scenes/map/inspect.tscn").instance()
    self.bind()

func bind():
    self.exit_button = self.screen_scene.get_node('panel/container/footer/exit_button')
    self.exit_button.connect('pressed', self, '_exit_button_pressed')

    self.name_label = self.screen_scene.get_node('panel/container/header/Label')

    self.wolf_avatar = self.screen_scene.get_node('panel/container/body/info/avatars/wilk')
    self.cmuch_avatar = self.screen_scene.get_node('panel/container/body/info/avatars/cmuch')
    self.borowy_avatar = self.screen_scene.get_node('panel/container/body/info/avatars/borowy')
    self.wolf_description = self.screen_scene.get_node('panel/container/body/info/Container/wilk')
    self.cmuch_description = self.screen_scene.get_node('panel/container/body/info/Container/cmuch')
    self.borowy_description = self.screen_scene.get_node('panel/container/body/info/Container/borowy')

func _exit_button_pressed():
    self.go_back()

func go_back():
    self.detach()
    self.bag.board.attach()

func inspect_event(event):
    self.wolf_avatar.hide()
    self.cmuch_avatar.hide()
    self.borowy_avatar.hide()
    self.wolf_description.hide()
    self.cmuch_description.hide()
    self.borowy_description.hide()

    if event.enemy_icon_type == self.bag.abstract_map.TILE_FOREST_ANIMAL:
        self.wolf_avatar.show()
        self.wolf_description.show()
        self.name_label.set_text('WILKI')
    if event.enemy_icon_type == self.bag.abstract_map.TILE_WATER_CREATURE:
        self.cmuch_avatar.show()
        self.cmuch_description.show()
        self.name_label.set_text('ĆMUCH')
    if event.enemy_icon_type == self.bag.abstract_map.TILE_FOREST_CREATURE:
        self.borowy_avatar.show()
        self.borowy_description.show()
        self.name_label.set_text('BOROWY')
