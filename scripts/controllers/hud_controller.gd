var bag
var moon
var day
var day_description

func _init_bag(bag):
    self.bag = bag

func refresh_resources():
    var resources_panel = self.bag.board.screen_scene.get_node('resources_panel/list')
    var resources = self.bag.resources.resources

    resources_panel.get_node('drewno/box/value').set_text(str(resources['wood']))
    resources_panel.get_node('mieso/box/value').set_text(str(resources['meat']))
    resources_panel.get_node('zborze/box/value').set_text(str(resources['wheat']))
    resources_panel.get_node('metal/box/value').set_text(str(resources['metal']))
    resources_panel.get_node('bursztyn/box/value').set_text(str(resources['amber']))
    resources_panel.get_node('futra/box/value').set_text(str(resources['fur']))

func refresh_moon(moves):
    var day = int(ceil(moves / 8)) + 1
    var phase = int(ceil(day / 3)) % 8
    self.bag.board.screen_scene.get_node('corner/calendar/moon').set_frame(phase)
    self.bag.board.screen_scene.get_node('corner/calendar/day').set_text('Dzień ' +str(day))

    var day_descr = self.bag.event_handler.get_day_name(day)
    self.bag.board.screen_scene.get_node('corner/calendar/description').set_text(day_descr)



