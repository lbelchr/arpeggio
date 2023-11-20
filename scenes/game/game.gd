extends Node2D

var day_summary_scene: PackedScene = preload("res://scenes/ui/modal/modal_summary.tscn")

func _ready():
	Manager.money = 100
	Manager.current_day = 1



func _on_cafe_finish_day():
	var summary_modal = day_summary_scene.instantiate()
	summary_modal.position.x = 555
	summary_modal.position.y = 318
	add_child(summary_modal)
