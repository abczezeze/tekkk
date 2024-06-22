extends Spatial
var rigidbody_turntable_c = preload("res://Scene/drag3d/rigidbody_turntable.tscn")
var rigidbody_turntable:RigidBody
var rigidbody_guitar_c = preload("res://Scene/drag3d/rigidbody_guitar.tscn")
var rigidbody_guitar:RigidBody
var rigidbody_drum_c = preload("res://Scene/drag3d/rigidbody_drum.tscn")
var rigidbody_drum:RigidBody
var rigidbody_bass_c = preload("res://Scene/drag3d/rigidbody_bass.tscn")
var rigidbody_bass:RigidBody

var mouse_positon:Vector2 = Vector2()
var speed:int = 10
var time_to_quere_free:float = 0
func _ready():
	pass

func _physics_process(delta):
	time_to_quere_free+=delta
	print(time_to_quere_free)
	mouse_positon = get_viewport().get_mouse_position()
	var from = $Camera.project_ray_origin(mouse_positon)
	var to = from + $Camera.project_ray_normal(mouse_positon) * 10
	if Input.is_action_just_pressed("ui_click"):
		rigidbody_turntable = rigidbody_turntable_c.instance()
		rigidbody_turntable.transform.origin = to
		self.add_child(rigidbody_turntable)
#		rigidbody_turntable.apply_central_impulse(Vector3(0,0,-100))
		rigidbody_turntable.linear_velocity.z = -10
#		print(rigidbody_turntable.translation.z)
		if time_to_quere_free>5:
			rigidbody_turntable.queue_free()
			time_to_quere_free = 0
		
