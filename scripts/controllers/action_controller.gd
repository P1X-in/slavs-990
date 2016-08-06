var bag

func _init_bag(bag):
    self.bag = bag

func load_game():
    self.bag.board.load_map()
    self.bag.map.load_tiles()

func handle_screen_click(position):
    self.handle_map_click(self.bag.map.translate_screen_to_map(position))

func handle_map_click(position):
    return