
var bag
var container
var screen_scene
var register_main_scene = true

func _init_bag(bag, container):
    self.bag = bag
    self.container = container

func attach():
    if self.container.is_a_parent_of(self.screen_scene):
        return
    self.container.add_child(self.screen_scene)
    if self.register_main_scene:
        self.bag.screens.register_screen(self)

func detach():
    if !self.container.is_a_parent_of(self.screen_scene):
        return
    self.container.remove_child(self.screen_scene)
    if self.register_main_scene:
        self.bag.screens.clear_screen()

func go_back():
    return