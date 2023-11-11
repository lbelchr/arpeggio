extends Label

@onready var parent: HBoxContainer = $".."

func _process(delta):
	text = parent.label_text
