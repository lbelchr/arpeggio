extends Button

@export var change_speed: float

func _pressed():
	Engine.time_scale = change_speed
