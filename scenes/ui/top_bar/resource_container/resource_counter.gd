extends HBoxContainer

@export var game_manager: Node2D
@export var resource_type: String
@export var prefix: String
@export var label_text: String

@onready var counter: Label = $Counter

func _process(delta):
	counter.text = prefix + str(game_manager.resources[resource_type])
