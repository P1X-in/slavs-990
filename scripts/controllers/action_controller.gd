var bag

func _init_bag(bag):
    self.bag = bag

func load_game():
    self.bag.board.load_map()
    self.bag.map.load_tiles()
    self.bag.camera.set_pos_map(self.bag.abstract_map.village_tile.position)
    self.bag.camera.unlock()
    self.bag.hud.refresh_resources()
    self.bag.party.set_map_pos(self.bag.abstract_map.start_tile.position)
    self.bag.unit_factory.spawn_events()

func handle_screen_click(position):
    self.handle_map_click(self.bag.map.translate_screen_to_map(position))

func handle_map_click(position):
    var field = self.bag.abstract_map.get_field(position)

    if field.is_settlement():
        self.bag.board.detach()
        self.bag.settlement.attach()

    if field.party != null:
        field.party.select()
    elif self.bag.party.selected and self.bag.party.can_move_to(field) and field.event != null and field.event.units != null:
        self.bag.party.go_to_field(field)
        self.bag.board.detach()
        self.bag.battle.attach()
        self.bag.battle.battle_event(field.event)
    elif self.bag.party.selected and self.bag.party.can_move_to(field):
        self.bag.party.go_to_field(field)
    elif (not self.bag.party.selected or not self.bag.party.can_move_to(field)) and field.event != null:
        self.bag.board.detach()
        self.bag.inspect.attach()
        self.bag.inspect.inspect_event(field.event)
    else:
        self.bag.party.unselect()