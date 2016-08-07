extends "res://scripts/services/abstract_screen.gd"

const LOG_TIME_INTERVAL = 0.5

var loot_templates = {
    'amber' : preload("res://scenes/map/resources/amber.tscn"),
    'leather' : preload("res://scenes/map/resources/leather.tscn"),
    'meat' : preload("res://scenes/map/resources/meat.tscn"),
    'metal' : preload("res://scenes/map/resources/metal.tscn"),
    'wheat' : preload("res://scenes/map/resources/wheat.tscn"),
    'wood' : preload("res://scenes/map/resources/wood.tscn"),
}

var exit_button

var enemy_label
var combat_log
var reward_bar

var icon_wolf
var icon_cmuch
var icon_borowy

var current_log
var log_in_progress = false
var iteration = 0
var last_winner
var last_event

var loot_icons = []

func _init():
    self.screen_scene = preload("res://scenes/map/battle.tscn").instance()
    self.bind()

func bind():
    self.exit_button = self.screen_scene.get_node('panel/container/footer/exit_button')
    self.exit_button.connect('pressed', self, '_exit_button_pressed')

    self.enemy_label = self.screen_scene.get_node('panel/container/body/log/enemy/Label')
    self.combat_log = self.screen_scene.get_node('panel/container/body/log/container/text')
    self.reward_bar = self.screen_scene.get_node('panel/container/footer/rewards/reward_list')

    self.combat_log.set_scroll_follow(true)

    self.icon_wolf = self.screen_scene.get_node('panel/container/body/log/enemy/Container/wilk')
    self.icon_cmuch = self.screen_scene.get_node('panel/container/body/log/enemy/Container/cmuch')
    self.icon_borowy = self.screen_scene.get_node('panel/container/body/log/enemy/Container/borowy')

func _exit_button_pressed():
    self.skip_log()
    self.detach()
    self.bag.board.attach()

func battle_event(event):
    self.combat_log.clear()
    self.clear_loot()
    self.show_enemy_icon(event.enemy_icon_type)

    self.last_event = event
    self.last_winner = self.bag.battle_resolver.resolve_fight(self.bag.party.units + event.units)

    self.enemy_label.set_text(event.units[0].family)

    self.current_log = self.bag.battle_log.show()
    self.log_in_progress = true
    self.iteration = 0

    self.progress_log()

func progress_log():
    if not self.log_in_progress:
        return

    if self.iteration == self.current_log.size():
        self.log_in_progress = false
        self.finish_battle()
        return

    var text = self.current_log[self.iteration]
    if text != '':
        self.combat_log.add_text(text)
    self.combat_log.newline()

    self.iteration = self.iteration + 1

    self.bag.timers.set_timeout(self.LOG_TIME_INTERVAL, self, 'progress_log')

func finish_battle():
    self.show_loot()

    if self.last_winner == 0:
        self.last_event.remove()
    else:
        self.bag.party.go_to_field(self.bag.abstract_map.start_tile)
        self.bag.camera.pan_to_map(self.bag.abstract_map.start_tile.position)

func show_loot():
    var loot = []
    var loot_icon

    if self.last_winner == 0:
        loot = self.bag.item_factory.generate_for_opponents(self.last_event.units)
        for name in loot.keys():
            self.bag.resources.add(name, loot[name])
            if self.loot_templates.has(name):
                loot_icon = self.loot_templates[name].instance()
                self.reward_bar.add_child(loot_icon)
                self.loot_icons.append(loot_icon)
                loot_icon.get_node('value').set_text(str(loot[name]))

        self.bag.hud.refresh_resources()

func clear_loot():
    for loot in self.loot_icons:
        self.reward_bar.remove_child(loot)
    self.loot_icons = []

func skip_log():
    if not self.log_in_progress:
        return

    self.log_in_progress = false
    self.finish_battle()

func show_enemy_icon(type):
    self.icon_wolf.hide()
    self.icon_cmuch.hide()
    self.icon_borowy.hide()

    if type == self.bag.abstract_map.TILE_FOREST_ANIMAL:
        self.icon_wolf.show()
    if type == self.bag.abstract_map.TILE_WATER_CREATURE:
        self.icon_cmuch.show()
    if type == self.bag.abstract_map.TILE_FOREST_CREATURE:
        self.icon_borowy.show()
