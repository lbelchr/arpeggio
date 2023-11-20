extends PanelContainer

@export var revenue: Label
@export var drinks: Label
@export var beans: Label
@export var cream: Label

# Called when the node enters the scene tree for the first time.
func _ready():
	revenue.text = "$" + str(Manager.revenue_day)
	drinks.text = str(Manager.cups_day)
	beans.text = str(Manager.beans_day)
	cream.text = str(Manager.cream_day)

func _on_button_button_down():
	queue_free()
