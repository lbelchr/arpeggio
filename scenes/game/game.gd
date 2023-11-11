extends Node2D

signal start_day

var resources = Resources.new(Resources.RESOURCE_TYPE.EMPTY)

func _ready():
	resources.cost = 100

func _start_day(supplies: Resources):
	# calculate supplies
	resources.cost -= supplies.cost
	resources.beans += supplies.beans
	resources.cups += supplies.cups
	resources.cream += supplies.cream
	start_day.emit()


func _on_menu_play(supplies: Resources):
	print("start day")
	_start_day(supplies)


func _on_cafe_process_order(order: Drink):
	resources.cost += order.cost
	resources.beans -= order.beans
	resources.cups -= order.cups
	resources.cream -= order.cream
