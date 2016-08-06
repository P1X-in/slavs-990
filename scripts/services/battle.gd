extends "res://scripts/services/abstract_screen.gd"

var exit_button

func _init():
    self.screen_scene = preload("res://scenes/map/battle.tscn").instance()
    self.bind()

func bind():
    self.exit_button = self.screen_scene.get_node('panel/container/footer/exit_button')
    self.exit_button.connect('pressed', self, '_exit_button_pressed')

func _exit_button_pressed():
    self.detach()
    self.bag.board.attach()

func battle_event(event):
    var winner = self.bag.battle_resolver.resolve_fight(self.bag.party.units + event.units)
    var logs = self.screen_scene.get_node('panel/container/body/log/container/text')
    var rewards = self.screen_scene.get_node('panel/container/footer/rewards/reward_list')
    var loot = []

    self.screen_scene.get_node('panel/container/body/log/enemy/Label').set_text(event.units[0].family)
    self.screen_scene.get_node('panel/container/body/log/ally/Label').set_text('Drużyna')

    for text in self.bag.battle_log.show():
        if not text == '':
            logs.add_text(text)
        logs.newline()

    if winner == 0:
        loot = self.bag.item_factory.generate_for_opponents(event.units)
        for name in loot.keys():
            self.bag.resources.add(name, loot[name])
            #TODO add loot named <name> with quantity <loot[name]>

        self.bag.hud.refresh_resources()
        #TODO - defeated enemy remove

    return
