extends Spatial
var rigidbody_turntable_c = preload("res://Scene/drag3d/rigidbody_turntable.tscn")
var rigidbody_turntable:RigidBody
var rigidbody_guitar_c = preload("res://Scene/drag3d/rigidbody_guitar.tscn")
var rigidbody_guitar:RigidBody
var rigidbody_drum_c = preload("res://Scene/drag3d/rigidbody_drum.tscn")
var rigidbody_drum:RigidBody
var rigidbody_bass_c = preload("res://Scene/drag3d/rigidbody_bass.tscn")
var rigidbody_bass:RigidBody

var player_ichuen_head_rigid_c = preload("res://Scene/shoot3d/player_ichuen_head_rigid.tscn")
var player_ichuen_head_rigid:RigidBody
var animation_ichuen:AnimationPlayer
var label_ichuen:Label3D

var dir_x_ichuen:float = 0.1
var dir_y_ichuen:float = 0.1
var move_speed_ichuen:float = 1
var clicked_ichuen:bool = false
export (Array,AudioStreamOGGVorbis) var sound_efx_ichuen = []

var mouse_positon:Vector2 = Vector2()
var speed:int = 10
var time_to_quere_free:float = 0
var timeMovePathFollow:float = 0

var dir_x_mno:float = 0.1
var move_speed_mno:float = 5
var clicked_mno:bool = false
export (Array,AudioStreamOGGVorbis) var sound_efx_mno = []

func _ready():
	new_player_ichue_head_rigid()
	
#	$player_ichuen_head/AnimationPlayer.play("idle")
#	dir_x_ichuen = rand_range(-1,1)
#	dir_y_ichuen = rand_range(-1,1)
#	$player_ichuen_head/Label3D.text = str(Global.save_dict["ichuen_scores"])
##	$player_ichuen_head.transform.origin.x = rand_range(-2,2)
#	var __1 = $player_ichuen_head/AnimationPlayer.connect("animation_finished",self,"_on_AnimationPlayer_ichuen")
	
#	$player_mno_head/AnimationPlayer.play("idle")
#	dir_x_mno = rand_range(-2,2)
#	$player_mno_head/Label3D.text = str(Global.save_dict["mno_scores"])
#	$player_mno_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-2)
#	var __2 = $player_mno_head/AnimationPlayer.connect("animation_finished",self,"_on_AnimationPlayer_mno")
	
func _on_AnimationPlayer_ichuen(_anim_name):
	$player_ichuen_head/ICBd/CPUParticles.emitting = false
	clicked_ichuen = false
	$player_ichuen_head/AnimationPlayer.play("idle")
	
#func _on_AnimationPlayer_mno(_anim_name):
#	$player_mno_head/mnoTrouser/CPUParticles.emitting = false
#	clicked_mno = false
#	$player_mno_head/AnimationPlayer.play("idle")

func _physics_process(delta):
	
	mouse_positon = get_viewport().get_mouse_position()
	var origin = $Camera.project_ray_origin(mouse_positon)
	var end = origin + $Camera.project_ray_normal(mouse_positon) * 5
	
	if Input.is_action_just_pressed("ui_click"):
#		var depth = origin.distance_to($player_ichuen_head.transform.origin)
#		var final_pos = origin + end * depth
		rigidbody_turntable = rigidbody_turntable_c.instance()
		rigidbody_turntable.global_transform.origin = end
		add_child(rigidbody_turntable)
		var forward = rigidbody_turntable.get_global_transform().basis.z
		forward*=-1
		rigidbody_turntable.apply_impulse(forward,forward*50)
#		print(rigidbody_turntable.get_global_transform().basis.z)

	if player_ichuen_head_rigid.translation.y < -13 or player_ichuen_head_rigid.translation.z < -20:
		player_ichuen_head_rigid.queue_free()
		new_player_ichue_head_rigid()
	
	label_ichuen.text = str(Global.save_dict["ichuen_scores"])
	
#	if has_rigidbody_turntable:
#		if rigidbody_turntable.transform.origin.z < -20:
#			rigidbody_turntable.queue_free()
		
func _on_player_ichuen_head_body_entered(body):
	print(body)
	if body.is_in_group("turntable"):
		Global.save_dict["ichuen_scores"]+=1
		rigidbody_turntable.queue_free()
#		$player_ichuen_head/ICBd/CPUParticles.emitting = true
		
func new_player_ichue_head_rigid():
	player_ichuen_head_rigid = player_ichuen_head_rigid_c.instance()
	add_child(player_ichuen_head_rigid)
	var __ = player_ichuen_head_rigid.connect("body_entered",self,"_on_player_ichuen_head_body_entered")
	player_ichuen_head_rigid.transform.origin = Vector3(rand_range(-2,2),5,-10)
	animation_ichuen = player_ichuen_head_rigid.get_node("AnimationPlayer")
	animation_ichuen.play("idle")
#	animation_ichuen.connect("animation_finished",self,"_on_AnimationPlayer_ichuen")
	label_ichuen = player_ichuen_head_rigid.get_node("Label3D")
