
var bag

var current_screen = null

func _init_bag(bag):
    self.bag = bag

func register_screen(screen):
    self.current_screen = screen

func clear_screen():
    self.current_screen = null

func go_back():
    if self.current_screen == null:
        return

    self.current_screen.go_back()