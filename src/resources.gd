extends Node

class_name Resources

var cost: int
var beans: int
var cups: int 
var cream: int

func _init(cost_arg: int, beans_arg: int, cups_arg: int, cream_arg: int):
	cost = cost_arg
	beans = beans_arg
	cups = cups_arg
	cream = cream_arg
	
func _reset():
	cost = 0
	beans = 0
	cups = 0
	cream = 0
