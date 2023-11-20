extends Node2D

@onready var spawn_timer: Timer = $SpawnTimer
@onready var animations: AnimationPlayer = $AnimationPlayer

signal finish_day

var num_customers: int
var customer_scene: PackedScene = preload("res://scenes/cafe/customer/customer.tscn")


func _simulate_day():
	Manager._reset_day()
	animations.play("idle")
	num_customers = _random(4, 10)
	_spawn_customer()
	spawn_timer.start()
	
func _random(from: int, to: int):
	return randi() % (to - from) + from

func _spawn_customer():
	num_customers -= 1
	var customer = customer_scene.instantiate() as CharacterBody2D
	customer.position = $CustomerSpawn.position
	add_child(customer)
	
func _on_menu_start_day():
	_simulate_day()

func _on_spawn_timer_timeout():
	if num_customers > 0:
		_spawn_customer()
	else:
		animations.stop()
		Manager._next_day()
		spawn_timer.stop()
		finish_day.emit()
		
