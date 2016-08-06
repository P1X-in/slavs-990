var bag

func _init_bag(bag):
    self.bag = bag

func load_game():
    self.bag.board.load_map()
    self.bag.map.load_tiles()
    self.bag.camera.set_pos_map(self.bag.abstract_map.village_tile.position)
    self.bag.camera.unlock()

func handle_screen_click(position):
    self.handle_map_click(self.bag.map.translate_screen_to_map(position))

func handle_map_click(position):
    var field = self.bag.abstract_map.get_field(position)

    print(position)

    if field.is_settlement():
        self.bag.board.detach()
        self.bag.settlement.attach()