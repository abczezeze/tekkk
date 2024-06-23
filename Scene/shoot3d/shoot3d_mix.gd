extends Spatial
var rigidbody_turntable_c = preload("res://Scene/drag3d/rigidbody_turntable.tscn")
var rigidbody_turntable:RigidBody
var rigidbody_guitar_c = preload("res://Scene/drag3d/rigidbody_guitar.tscn")
var rigidbody_guitar:RigidBody
var rigidbody_drum_c = preload("res://Scene/drag3d/rigidbody_drum.tscn")
var rigidbody_drum:RigidBody
var rigidbody_bass_c = preload("res://Scene/drag3d/rigidbody_bass.tscn")
var rigidbody_bass:RigidBody

var dir_x_ichuen:float = 0.1
var dir_y_ichuen:float = 0.1
var move_speed_ichuen:float = 1
var clicked_ichuen:bool = false
export (Array,AudioStreamOGGVorbis) var sound_efx_ichuen = []

var mouse_positon:Vector2 = Vector2()
var speed:int = 10
var time_to_quere_free:float = 0

var dir_x_mno:float = 0.1
var move_speed_mno:float = 5
var clicked_mno:bool = false
export (Array,AudioStreamOGGVorbis) var sound_efx_mno = []

func _ready():
	$player_ichuen_head/AnimationPlayer.play("idle")
	dir_x_ichuen = rand_range(-1,1)
	dir_y_ichuen = rand_range(-1,1)
	$player_ichuen_head/Label3D.text = str(Global.save_dict["ichuen_scores"])
	$player_ichuen_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-3)
	var __1 = $player_ichuen_head/AnimationPlayer.connect("animation_finished",self,"_on_AnimationPlayer_ichuen")
	
#	$player_mno_head/AnimationPlayer.play("idle")
#	dir_x_mno = rand_range(-2,2)
#	$player_mno_head/Label3D.text = str(Global.save_dict["mno_scores"])
#	$player_mno_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-2)
#	var __2 = $player_mno_head/AnimationPlayer.connect("animation_finished",self,"_on_AnimationPlayer_mno")
	
func _on_AnimationPlayer_ichuen(_anim_name):
	$player_ichuen_head/ICBd/CPUParticles.emitting = false
	clicked_ichuen = false
	$player_ichuen_head/AnimationPlayer.play("idle")
	
func _on_AnimationPlayer_mno(_anim_name):
	$player_mno_head/mnoTrouser/CPUParticles.emitting = false
	clicked_mno = false
	$player_mno_head/AnimationPlayer.play("idle")

func _process(delta):
	#ichuen move
	$player_ichuen_head.translation += Vector3(dir_x_ichuen*move_speed_ichuen*delta,dir_y_ichuen*move_speed_ichuen*delta,0)
	if $player_ichuen_head.transform.origin.x>2:
		dir_x_ichuen = rand_range(-1,0)
		$player_ichuen_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-3)
	elif $player_ichuen_head.transform.origin.x<-2:
		dir_x_ichuen = rand_range(0,1)
		$player_ichuen_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-3)
	#mno move
#	$player_mno_head.translation.x += dir_x_mno*move_speed_mno*delta
#	if $player_mno_head.transform.origin.x>2:
#		dir_x_mno = rand_range(-2,0)
#		$player_mno_head.transform.origin = Vector3(1,rand_range(-3,3),-2)
#	elif $player_mno_head.transform.origin.x<-2:
#		dir_x_mno = rand_range(0,2)
#		$player_mno_head.transform.origin = Vector3(-1,rand_range(-3,3),-2)
		
func _physics_process(delta):
	mouse_positon = get_viewport().get_mouse_position()
	var origin = $Camera.project_ray_origin(mouse_positon)
	var end = $Camera.project_ray_normal(mouse_positon)
	var depth = origin.distance_to($player_ichuen_head.transform.origin)
	var final_pos = origin + end * depth
	if Input.is_action_just_pressed("ui_click"):
		rigidbody_turntable = rigidbody_turntable_c.instance()
		rigidbody_turntable.transform.origin = final_pos
		
		self.add_child(rigidbody_turntable)
#		rigidbody_turntable.linear_velocity.z = -20
		rigidbody_turntable.set_axis_velocity(Vector3(0,0,-100))
		rigidbody_turntable.gravity_scale = 1
#		print(rigidbody_turntable.translation.z)

func _on_player_ichuen_head_body_entered(body):
	print(body)
	if body.is_in_group("turntable"):
		Global.save_dict["ichuen_scores"]+=1
		$player_ichuen_head/Label3D.text = str(Global.save_dict["ichuen_scores"])
		$player_ichuen_head.set_process(false)
