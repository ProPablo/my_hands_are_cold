extends KinematicBody2D

export var SPEED = 50;
export var POINTER_RADIUS = 1;
var vel = Vector2()
var angle_to_fire = 0;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var move_vec = Vector2();
	if (Input.is_action_pressed("move_up")):
		move_vec.y -=1;
	if (Input.is_action_pressed("move_down")):
		move_vec.y +=1
	if (Input.is_action_pressed("move_left")):
		move_vec.x -=1
	if (Input.is_action_pressed("move_right")):
		move_vec.x +=1
	move_vec = move_vec.normalized()
	vel = move_vec * SPEED;
#	var mouse_pos = get_viewport().get_mouse_position()
	
	
#	print("Mouse" + str(mouse_pos))
	
	
func _physics_process(delta):
	move_and_slide(vel);

func _input(event):
#	print(event.position)
	if (event is InputEventMouseMotion):
		var mouse_pos = get_global_mouse_position();
#		$Pointer.look_at(mouse_pos)
		var dir_to_mouse = mouse_pos - position;
		angle_to_fire = atan2(dir_to_mouse.y, dir_to_mouse.x);
		$Pointer.rotation = angle_to_fire;
		$Pointer.position = Vector2(cos(angle_to_fire), sin(angle_to_fire)).normalized() * POINTER_RADIUS;
#		print("Mouse motion " + str(event.position))
