extends CharacterBody2D

signal order(order_type: int)

@export var speed: int = 200
@onready var sprite: Sprite2D = $Sprite2D

var direction: int
var moving: bool
var order_type: int

# Called when the node enters the scene tree for the first time.
func _ready():
	direction = -1
	moving = true
	sprite.frame = 1
	_randomize_order()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if moving:
		velocity.y = direction * speed
		move_and_slide()

func _randomize_order():
	order_type = randi() % 2

func _order():
	moving = false
	order.emit(Drink.new(order_type))
	$Timer.start()


func _on_timer_timeout():
	direction = 1
	moving = true
	sprite.frame = 0
