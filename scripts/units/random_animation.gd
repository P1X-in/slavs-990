export var MAX_FRAMES = 3

func _init():
    self.seek(randi() % MAX_FRAMES)