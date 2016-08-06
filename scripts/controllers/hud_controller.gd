var bag

func _init_bag(bag):
    self.bag = bag

func refresh_resources():
    var resources_panel = self.bag.board.screen_scene.get_node('resources_panel/list')
    var resources = self.bag.resources.resources

    resources_panel.get_node('drewno').set_text('drewno: '+ str(resources['wood']))
    resources_panel.get_node('mieso').set_text('mięso: '+ str(resources['meat']))
    resources_panel.get_node('zborze').set_text('zborze: '+ str(resources['wheat']))
    resources_panel.get_node('metal').set_text('metal: '+ str(resources['metal']))
    resources_panel.get_node('bursztyn').set_text('bursztyn: '+ str(resources['amber']))


