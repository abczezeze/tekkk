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
var sfx_ichuen:AudioStreamPlayer
var paticle_ichuen:CPUParticles

export (Array,AudioStreamOGGVorbis) var sound_efx_ichuen = []
export (Array,AudioStreamOGGVorbis) var sound_efx_mno = []

var mouse_positon:Vector2 = Vector2()
var speed:int = 10

func _ready():
	new_player_ichue_head_rigid()
	
func _physics_process(delta):
	mouse_positon = get_viewport().get_mouse_position()
	var origin = $Camera.project_ray_origin(mouse_positon)
	var end = origin + $Camera.project_ray_normal(mouse_positon) * 3
	
	if Input.is_action_just_pressed("ui_click"):
#		var depth = origin.distance_to($player_ichuen_head.transform.origin)
#		var final_pos = origin + end * depth
		rigidbody_turntable = rigidbody_turntable_c.instance()
		
		rigidbody_turntable.global_transform.origin = end
		add_child(rigidbody_turntable)
		var forward = rigidbody_turntable.get_global_transform().basis.z
		forward*=-1
		rigidbody_turntable.apply_impulse(forward,forward*50)
		
	if is_instance_valid(rigidbody_turntable):
		if rigidbody_turntable.global_transform.origin.z < -20:
			rigidbody_turntable.queue_free()

	if player_ichuen_head_rigid.translation.y < -13 or player_ichuen_head_rigid.translation.z < -20:
		player_ichuen_head_rigid.queue_free()
		new_player_ichue_head_rigid()
	
#	label_ichuen.text = str(Global.save_dict["ichuen_scores"])

func _on_player_ichuen_head_body_entered(body):
	print(body)
	if body.is_in_group("turntable"):
		Global.save_dict["ichuen_scores"]+=1
		paticle_ichuen.emitting = false
		animation_ichuen.play("head_rotation")

func _on_AnimationPlayer_ichuen(_anim_name):
	paticle_ichuen.emitting = false
	animation_ichuen.play("idle")

func new_player_ichue_head_rigid():
	player_ichuen_head_rigid = player_ichuen_head_rigid_c.instance()
	add_child(player_ichuen_head_rigid)
	player_ichuen_head_rigid.transform.origin = Vector3(rand_range(-2,2),5,-7)
	label_ichuen = player_ichuen_head_rigid.get_node("Label3D")
	paticle_ichuen = player_ichuen_head_rigid.get_node("ICBd/CPUParticles")
	animation_ichuen = player_ichuen_head_rigid.get_node("AnimationPlayer")
	animation_ichuen.play("idle")
	var __2 = animation_ichuen.connect("animation_finished",self,"_on_AnimationPlayer_ichuen")
	var __ = player_ichuen_head_rigid.connect("body_entered",self,"_on_player_ichuen_head_body_entered")
	


func _on_home_button_pressed():
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")
