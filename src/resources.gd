extends Node

class_name Resources

enum RESOURCE_TYPE { COST, BEANS, CUPS, CREAM, EMPTY }

var cost: int = 0
var beans: int = 0
var cups: int = 0
var cream: int = 0

func _init(resource_type: RESOURCE_TYPE):
	match resource_type:
		RESOURCE_TYPE.BEANS:
			beans = 1
			cost = 1
		RESOURCE_TYPE. CUPS:
			cups = 1
			cost = 1
		RESOURCE_TYPE.CREAM:
			cream = 1
			cost = 1
		RESOURCE_TYPE.EMPTY:
			pass;
	
func _reset():
	cost = 0
	beans = 0
	cups = 0
	cream = 0

func _add(add_resource: Resources):
	cost += add_resource.cost
	beans += add_resource.beans
	cups += add_resource.cups
	cream += add_resource.cream

func _sub(add_resource: Resources):
	cost -= add_resource.cost
	beans -= add_resource.beans
	cups -= add_resource.cups
	cream -= add_resource.cream

func _get_by_type(type: RESOURCE_TYPE) -> int:
	match type:
		RESOURCE_TYPE.COST:
			return cost
		RESOURCE_TYPE.BEANS:
			return beans
		RESOURCE_TYPE.CUPS:
			return cups
		RESOURCE_TYPE.CREAM:
			return cream
		RESOURCE_TYPE.EMPTY:
			return 0
	return 0


static func _get_label(type: RESOURCE_TYPE) -> String:
	match type:
		RESOURCE_TYPE.COST:
			return "Cost"
		RESOURCE_TYPE.BEANS:
			return "Beans"
		RESOURCE_TYPE.CUPS:
			return "Cups"
		RESOURCE_TYPE.CREAM:
			return "Cream"
		RESOURCE_TYPE.EMPTY:
			return ""
	return ""