extends "res://scripts/services/abstract_screen.gd"

const LOG_TIME_INTERVAL = 0.5

var exit_button

var enemy_label

var combat_log
var reward_bar

var current_log
var log_in_progress = false
var iteration = 0
var last_winner
var last_event

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

func _exit_button_pressed():
    self.skip_log()
    self.detach()
    self.bag.board.attach()

func battle_event(event):

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
        self.show_loot()
        return

    var text = self.current_log[self.iteration]
    if text != '':
        self.combat_log.add_text(text)
    self.combat_log.newline()

    self.iteration = self.iteration + 1

    self.bag.timers.set_timeout(self.LOG_TIME_INTERVAL, self, 'progress_log')

func show_loot():
    var loot = []

    if self.last_winner == 0:
        loot = self.bag.item_factory.generate_for_opponents(self.last_event.units)
        for name in loot.keys():
            self.bag.resources.add(name, loot[name])
            #TODO add loot named <name> with quantity <loot[name]>

        self.bag.hud.refresh_resources()
        #TODO - defeated enemy remove

func skip_log():
    if not self.log_in_progress:
        return

    self.log_in_progress = false
    self.show_loot()
