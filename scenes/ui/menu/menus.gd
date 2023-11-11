extends PanelContainer

signal play(supplies: Resources)
var supplies: Resources

func _ready():
	supplies = Resources.new(0, 0, 0, 0)
	

func _on_coffee_button_button_down():
	supplies.beans += 1
	supplies.cost += 1


func _on_cups_button_button_down():
	supplies.cups += 1
	supplies.cost += 1


func _on_cream_button_button_down():
	supplies.cream += 1
	supplies.cost += 1


func _on_play_button_down():
	play.emit(supplies)
