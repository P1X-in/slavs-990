
var bag

var keyboard_template = preload("res://scripts/input/keyboard.gd")
var gamepad_template = preload("res://scripts/input/gamepad.gd")
var mouse_template = preload("res://scripts/input/mouse.gd")

var devices = {
    "keyboard" : self.keyboard_template.new(),
    "mouse" : preload("res://scripts/input/mouse.gd").new()
}

func _init_bag(bag):
    self.bag = bag
    self.load_basic_input()

func handle_event(event):
    for device in self.devices:
        if self.devices[device].can_handle(event):
            self.devices[device].handle_event(event)

func load_basic_input():
    self.devices['mouse'].register_handler(preload("res://scripts/input/handlers/skip_intro_mouse.gd").new(self.bag))
    self.devices['mouse'].register_handler(preload("res://scripts/input/handlers/camera_drag_click_mouse.gd").new(self.bag))
    self.devices['mouse'].register_handler(preload("res://scripts/input/handlers/camera_drag_move_mouse.gd").new(self.bag))
    self.devices['mouse'].register_handler(preload("res://scripts/input/handlers/map_click_mouse.gd").new(self.bag))
    #self.devices['mouse'].register_handler(preload("res://scripts/input/handlers/zoom_in_mouse.gd").new(self.bag))
    #self.devices['mouse'].register_handler(preload("res://scripts/input/handlers/zoom_out_mouse.gd").new(self.bag))
    self.devices['mouse'].register_handler(preload("res://scripts/input/handlers/move_selector_mouse.gd").new(self.bag))

    self.devices['keyboard'].register_handler(preload("res://scripts/input/handlers/skip_intro_keyboard.gd").new(self.bag))
    self.devices['keyboard'].register_handler(preload("res://scripts/input/handlers/go_back_keyboard.gd").new(self.bag))
