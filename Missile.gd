extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var velocity_mag = 12;
var look_direction = Vector2();

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start(shoot_dir):
	look_direction = shoot_dir;
	pass

func _physics_process(delta):
	var movement = look_direction * velocity_mag * delta; 
	move_and_collide(movement);



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
