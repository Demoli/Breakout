extends KinematicBody2D

class_name Ball

var size: int = 10
var speed: int = 500
var velocity: Vector2 = Vector2(0,0)
var fired = false
var fire_angle = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.

func _draw():
		draw_circle(Vector2(0 ,0), size, Color(Color.blue))

func _process(delta):
	if Input.is_action_just_pressed("fire_ball") and not fired:
		fire()
	
#	print(rad2deg(velocity.angle()))	
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		handle_collision(collision)

func fire() -> void:

	velocity.y = -speed

	var start_x = randi() % 2

	if start_x == 1:
		velocity = velocity.rotated(deg2rad(-fire_angle))
	else: 
		velocity = velocity.rotated(deg2rad(fire_angle))

	fired = true

func handle_collision(collision) -> void:
	if collision.collider is Wall:
		velocity = velocity.bounce(collision.normal)
	if collision.collider is Player:
		collision.collider.apply_bounce(collision, self)
