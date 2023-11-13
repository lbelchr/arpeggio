@tool
extends Label

func _process(_delta):
	if Engine.is_editor_hint():
		text = $"..".label
