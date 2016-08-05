var bag
var mount

func _ready():
    self.mount = self.get_node("/root/main/mount")

    self.bag = preload("res://scripts/services/bag.gd").new(self)
    self.set_process_input(true)
    self.set_fixed_process(true)

    self.bag.intro.attach()

    var units = self.bag.unit_factory.generate(6, 0)  + self.bag.unit_factory.generate(6, 1)
    self.bag.battle_autoresolver.resolve_fight(units)

    print(self.bag.battle_log.show())

    #self.bag.sound.play_soundtrack('intro')

func _input(event):
    self.bag.input.handle_event(event)