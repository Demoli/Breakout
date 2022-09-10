extends KinematicBody2D

class_name Player

var min_width: int = 60
var max_width: int = 200
var paddle_size_modifier = 20

export var width: int = 100 setget set_width, get_width
export var height: int = 20 setget set_width, get_width
export var speed: int = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CollisionShape2D.shape.extents.x = get_width() / 2
	$CollisionShape2D.shape.extents.y = get_height() / 2
	
	if Input.is_action_pressed("player_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("player_right"):
		position.x += speed * delta
		
	if Input.is_action_just_pressed("debug_player_bigger"):
		set_width(get_width() + paddle_size_modifier)
	if Input.is_action_just_pressed("debug_player_smaller"):
		set_width(get_width() - paddle_size_modifier)
	
func _draw():
	draw_rect(Rect2(0 - width / 2, 0 - height / 2, width, height), Color(Color.whitesmoke),true)
	
func set_width(new: int):
	if new < min_width or new > max_width:
		return
		
	width = new
	update()
	
func get_width() -> int:
	return width

func set_height(new: int):
	height = new
	
func get_height() -> int:
	return height
