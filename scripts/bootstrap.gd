var bag
var mount

func _ready():
    self.mount = self.get_node("/root/main/mount")

    self.bag = preload("res://scripts/services/bag.gd").new(self)
    self.set_process_input(true)
    self.set_fixed_process(true)

    self.bag.intro.attach()
    # self.__battle()
    # var units = self.bag.unit_factory.generate(4, 1)
    # var loot = self.bag.item_factory.generate_for_opponents(units)
    # print(loot)

    self.bag.hud.refresh_resources()

    self.bag.sound.play_soundtrack('theme')

func _input(event):
    self.bag.input.handle_event(event)

func __battle():
    var units = self.bag.unit_factory.generate(2, 0)  + self.bag.unit_factory.generate(6, 1)
    self.bag.battle_resolver.resolve_fight(units)

    print(self.bag.battle_log.show())
