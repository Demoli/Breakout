extends KinematicBody2D


var size: int = 10
var speed: int = 200
var velocity: Vector2 = Vector2(0,0)
var fired = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.

func _draw():
		draw_circle(Vector2(0 ,0), size, Color(Color.blue))

func _process(delta):
	if Input.is_action_just_pressed("fire_ball") and not fired:
		fire()
	
	var collisions = move_and_collide(velocity * delta)
	if collisions:
		handle_collisions(collisions)

func fire() -> void:
	var start_x = randi() % 2
	
	if start_x == 1:
		velocity.x += speed # left
	else: 
		velocity.x -= speed # right

	velocity.y -= speed

	fired = true

func handle_collisions(collisions) -> void:
	pass
