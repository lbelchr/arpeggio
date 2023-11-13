extends Node

@export var source_property: String
@export var prefix: String
@export var label: String

@export var counter: Label
@export var child_label: Label

func _process(_delta):
	counter.text = prefix
	counter.text = prefix + str(Manager[source_property])
	child_label.text = label


func _on_add_button_button_down():
	Manager[source_property] += 1
	Manager.cost_supply += 1


func _on_subtract_button_button_down():
	Manager[source_property] -= 1
	Manager.cost_supply -= 1
