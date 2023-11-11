extends Node

@export var source: Node2D
@export var prefix: String
@export var type: Resources.RESOURCE_TYPE

@export var counter: Label
@export var child_label: Label

signal add_item(add_resource: Resources)
signal sub_item(sub_resource: Resources)

func _process(_delta):
	counter.text = prefix + str(source.resources._get_by_type(type))
	child_label.text = Resources._get_label(type)


func _on_add_button_button_down():
	add_item.emit(Resources.new(type))


func _on_subtract_button_button_down():
	sub_item.emit(Resources.new(type))
