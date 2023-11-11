extends Node2D

signal start_day

var resources = {"money": 100, "beans": 0, "cups": 0, "cream": 0}

func _start_day(supplies: Resources):
	# calculate supplies
	resources.money -= supplies.cost
	resources.beans += supplies.beans
	resources.cups += supplies.cups
	resources.cream += supplies.cream
	start_day.emit()


func _on_menus_play(supplies: Resources):
	_start_day(supplies)


func _on_cafe_process_order(order: Resources):
	resources.money += order.cost
	resources.beans -= order.beans
	resources.cups -= order.cups
	resources.cream -= order.cream
