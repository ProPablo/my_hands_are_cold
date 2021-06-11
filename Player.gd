extends KinematicBody2D
var vel = Vector2()
export var speed = 50;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var move_vec = Vector2()
	if (Input.is_action_pressed("move_up")):
		move_vec.y -=1;
	if (Input.is_action_pressed("move_down")):
		move_vec.y +=1
	if (Input.is_action_pressed("move_left")):
		move_vec.x -=1
	if (Input.is_action_pressed("move_right")):
		move_vec.x +=1
	move_vec = move_vec.normalized()
	vel = move_vec * speed;
	
func _physics_process(delta):
	move_and_slide(vel);
