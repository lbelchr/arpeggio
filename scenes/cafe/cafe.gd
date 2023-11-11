extends Node2D

signal process_order(order: Resources)

@onready var spawn_timer: Timer = $SpawnTimer

var day_stats: Resources
var num_customers: int

var customer_scene: PackedScene = preload("res://scenes/cafe/customer/customer.tscn")

func _ready():
	day_stats = Resources.new(Resources.RESOURCE_TYPE.EMPTY)

func _simulate_day():
	print("Starting Day")
	day_stats._reset()
	num_customers = 0
	num_customers = _random(4, 10)
	print("Numer of customers: " + str(num_customers))
	_spawn_customer()
	spawn_timer.start()
	
func _random(from: int, to: int):
	return randi() % (to - from) + from

func _spawn_customer():
	num_customers -= 1
	var customer = customer_scene.instantiate() as CharacterBody2D
	customer.position = $CustomerSpawn.position
	customer.direction = -1
	customer.order.connect(_receive_order)
	add_child(customer)
	
	
func _receive_order(order: Drink):
	## send to game
	process_order.emit(order)
	_track_order(order)
	
	
func _track_order(order: Drink):
	day_stats.cost += order.cost
	day_stats.beans += order.beans
	day_stats.cups += order.cups
	day_stats.cream += order.cream
	
	
func _on_game_start_day():
	_simulate_day()


func _on_spawn_timer_timeout():
	if num_customers > 0:
		_spawn_customer()
		
