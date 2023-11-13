extends Area2D

@export var incoming_direction: Manager.DIRECTION
@export var outgoing_direction: Manager.DIRECTION

func _on_body_entered(body: Node2D):
	if body.has_method("change_direction"):
		if body.route_direction == incoming_direction:
			body.change_direction(outgoing_direction)
