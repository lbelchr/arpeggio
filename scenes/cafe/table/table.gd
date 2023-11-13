extends Area2D


func _on_body_entered(body):
	if body.has_method("submit_order"):
		body.submit_order()
