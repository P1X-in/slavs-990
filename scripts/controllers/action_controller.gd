var bag

func _init_bag(bag):
    self.bag = bag

func load_game():
    self.bag.board.load_map()