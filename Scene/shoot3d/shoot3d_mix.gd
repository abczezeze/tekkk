extends Spatial
var rigidbody_turntable_c = preload("res://Scene/drag3d/rigidbody_turntable.tscn")
var rigidbody_turntable:RigidBody
var rigidbody_guitar_c = preload("res://Scene/drag3d/rigidbody_guitar.tscn")
var rigidbody_guitar:RigidBody
var rigidbody_drum_c = preload("res://Scene/drag3d/rigidbody_drum.tscn")
var rigidbody_drum:RigidBody
var rigidbody_bass_c = preload("res://Scene/drag3d/rigidbody_bass.tscn")
var rigidbody_bass:RigidBody

var mouse_positon = Vector2()
var mouse_sens= 300.0
var mouse_speed = 5

func _ready():
	pass

func _physics_process(delta):
	var from = $Camera.project_ray_origin(mouse_positon)
	var to = from + $Camera.project_ray_normal(mouse_positon) * 10
	if Input.is_action_just_pressed("ui_accept"):
		rigidbody_turntable = rigidbody_turntable_c.instance()
		rigidbody_turntable.global_transform.origin = to
		self.add_child(rigidbody_turntable)
		
