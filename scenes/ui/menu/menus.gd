extends Node2D

signal play(resources: Resources)
var resources: Resources

func _ready():
	resources = Resources.new(Resources.RESOURCE_TYPE.EMPTY)

func _on_play_button_down():
	play.emit(resources)


func _on_item_counter_add_item(add_resource: Resources):
	resources._add(add_resource)


func _on_item_counter_sub_item(sub_resource):
	resources._sub(sub_resource)
