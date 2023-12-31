extends Area2D

@export var incoming_direction: Manager.DIRECTION
@export var outgoing_direction: Manager.DIRECTION

func _physics_process(_delta):
	if has_overlapping_bodies():
		for body in get_overlapping_bodies():
			if body.has_method("change_direction"):
				if body.route_direction == incoming_direction:
					body.change_direction(outgoing_direction)
