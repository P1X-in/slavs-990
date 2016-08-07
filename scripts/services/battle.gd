extends "res://scripts/services/abstract_screen.gd"

var exit_button

var enemy_label
var combat_log = self.screen_scene.get_node('panel/container/body/log/container/text')
var reward_bar = self.screen_scene.get_node('panel/container/footer/rewards/reward_list')

func _init():
    self.screen_scene = preload("res://scenes/map/battle.tscn").instance()
    self.bind()

func bind():
    self.exit_button = self.screen_scene.get_node('panel/container/footer/exit_button')
    self.exit_button.connect('pressed', self, '_exit_button_pressed')

    self.enemy_label = self.screen_scene.get_node('panel/container/body/log/enemy/Label')

func _exit_button_pressed():
    self.detach()
    self.bag.board.attach()

func battle_event(event):
    var winner = self.bag.battle_resolver.resolve_fight(self.bag.party.units + event.units)
    var loot = []

    self.enemy_label.set_text(event.units[0].family)

    for text in self.bag.battle_log.show():
        if not text == '':
            self.combat_log.add_text(text)
        self.combat_log.newline()

    if winner == 0:
        loot = self.bag.item_factory.generate_for_opponents(event.units)
        for name in loot.keys():
            self.bag.resources.add(name, loot[name])
            #TODO add loot named <name> with quantity <loot[name]>

        self.bag.hud.refresh_resources()
        #TODO - defeated enemy remove

