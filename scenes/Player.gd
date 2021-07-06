extends KinematicBody2D


const MissilePrefab = preload("res://scenes/Missile.tscn")
export var SPEED = 50;
export var POINTER_RADIUS = 1;
var vel = Vector2()
#var angle_to_fire = 0;
var dir_to_mouse = Vector2()
onready var global = get_parent()
onready var pointer = $Pointer

enum {
	SHOOTING,
	PRIMING
}

var state = PRIMING
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if (state != SHOOTING):
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
		
		if (Input.is_action_just_pressed("shoot")):
			state = SHOOTING
			var missile = MissilePrefab.instance()
			missile.start(dir_to_mouse)
			global.add_child(missile)
			missile.position = $Pointer.global_position
			missile.get_child(0).current = true
			pointer.visible = false
			
	
	
func _physics_process(delta):
	if (state != SHOOTING):
		move_and_slide(vel);
	
func _input(event):
#	print(event.position)
	if (event is InputEventMouseMotion):
		var mouse_pos = get_global_mouse_position();
#		$Pointer.look_at(mouse_pos)
		dir_to_mouse = mouse_pos - position;
		dir_to_mouse = dir_to_mouse.normalized()
		var angle_to_fire = atan2(dir_to_mouse.y, dir_to_mouse.x);
		
		$Pointer.rotation = angle_to_fire;
		$Pointer.position = dir_to_mouse * POINTER_RADIUS;
#		print("Mouse motion " + str(event.position))
