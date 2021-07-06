extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 60;
var look_dir = Vector2();
onready var screen_size = Vector2(ProjectSettings.get_setting("display/window/size/width"), ProjectSettings.get_setting("display/window/size/height"))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start(shoot_dir):
	look_dir = shoot_dir;
	rotation = look_dir.angle()
	pass

func _input(event):
	if (event is InputEventMouseMotion):
		var mouse_pos = event.position
		
		var middle = screen_size/2
		look_dir = (mouse_pos - middle).normalized()
		rotation = look_dir.angle()
#		print("Mouse Motion at: %s" % mouse_pos)

func _physics_process(delta):
	var movement = look_dir * speed * delta; 
	move_and_collide(movement);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
