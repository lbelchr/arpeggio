extends CharacterBody2D

@export var speed: int = 200
@onready var sprite: Sprite2D = $Sprite2D

var y_direction: int
var x_direction: int
var route_direction: int
var moving: bool
var drink_order: Drink

func _ready():
	route_direction = Manager.DIRECTION.UP
	moving = true
	sprite.frame = 12
	_create_random_drink()
	
func _process(_delta):
	_get_direction()
	if moving:
		velocity.y = y_direction * speed
		velocity.x = x_direction * speed
		move_and_slide()

func _create_random_drink():
	drink_order = Drink.new(randi() % 2)

func submit_order():
	moving = false
	Manager._process_order(drink_order)
	$Timer.start()

func change_direction(new_direction: Manager.DIRECTION):
	route_direction = new_direction
	match route_direction:
		Manager.DIRECTION.UP: 
			sprite.frame = 12
		Manager.DIRECTION.DOWN: 
			sprite.frame = 0
		Manager.DIRECTION.LEFT: 
			sprite.frame = 8
		Manager.DIRECTION.RIGHT: 
			sprite.frame = 4

func _get_direction():
	match route_direction:
		Manager.DIRECTION.UP: 
			y_direction = -1
			x_direction = 0
		Manager.DIRECTION.DOWN: 
			y_direction = 1
			x_direction = 0
		Manager.DIRECTION.LEFT: 
			y_direction = 0
			x_direction = -1
		Manager.DIRECTION.RIGHT: 
			y_direction = 0
			x_direction = 1

# after order
func _on_timer_timeout():
	route_direction = Manager.DIRECTION.DOWN
	moving = true
	sprite.frame = 0
