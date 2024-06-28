extends Spatial

var rigidbody_turntable_c:PackedScene = preload("res://Scene/drag3d/rigidbody_turntable.tscn")
var rigidbody_turntable:RigidBody
var rigidbody_guitar_c :PackedScene= preload("res://Scene/drag3d/rigidbody_guitar.tscn")
var rigidbody_guitar:RigidBody
var rigidbody_drum_c:PackedScene = preload("res://Scene/drag3d/rigidbody_drum.tscn")
var rigidbody_drum:RigidBody
var rigidbody_bass_c:PackedScene = preload("res://Scene/drag3d/rigidbody_bass.tscn")
var rigidbody_bass:RigidBody

var player_ichuen_head_rigid_c:PackedScene = preload("res://Scene/shoot3d/player_ichuen_head_rigid.tscn")
var player_ichuen_head_rigid:RigidBody
var animation_ichuen:AnimationPlayer
var sfx_ichuen:AudioStreamPlayer
var paticle_ichuen:CPUParticles

var player_mno_head_rigid_c:PackedScene = preload("res://Scene/shoot3d/player_mno_head_rigid.tscn")
var player_mno_head_rigid:RigidBody
var animation_mno:AnimationPlayer
var sfx_mno:AudioStreamPlayer
var paticle_mno:CPUParticles

var player_olay_head_rigid_c:PackedScene = preload("res://Scene/shoot3d/player_olay_head_rigid.tscn")
var player_olay_head_rigid:RigidBody
var animation_olay:AnimationPlayer
var sfx_olay:AudioStreamPlayer
var paticle_olay:CPUParticles

var player_speng_head_rigid_c:PackedScene = preload("res://Scene/shoot3d/player_speng_head_rigid.tscn")
var player_speng_head_rigid:RigidBody
var animation_speng:AnimationPlayer
var sfx_speng:AudioStreamPlayer
var paticle_speng:CPUParticles

export (Array,AudioStreamOGGVorbis) var sound_efx_ichuen = []
export (Array,AudioStreamOGGVorbis) var sound_efx_mno = []
export (Array,AudioStreamOGGVorbis) var sound_efx_olay = []
export (Array,AudioStreamOGGVorbis) var sound_efx_speng = []

export (Array,AudioStreamMP3) var sound_bgm_shoot = []

var turntable_selected:bool = false
var bass_selected:bool = false
var drum_selected:bool = false
var guitar_selected:bool = false
var musical_selected:Array = [true,false,false,false]

var mouse_positon:Vector2 = Vector2()
var shoot_power:int = 60

func _ready():
	new_player_ichuen_head_rigid()
	new_player_mno_head_rigid()
	new_player_olay_head_rigid()
	new_player_speng_head_rigid()
	
	random_musical()
	$shoot3d_sound.play()
	
func _process(delta):
	$score_vbox/ClickMno.text=str(Global.save_dict["mno_scores"])
	$score_vbox/ClickOlay.text=str(Global.save_dict["olay_scores"])
	$score_vbox/ClickIchuen.text=str(Global.save_dict["ichuen_scores"])
	$score_vbox/ClickSpeng.text=str(Global.save_dict["speng_scores"])
	
func _physics_process(delta):
	if is_instance_valid(rigidbody_turntable):
		if rigidbody_turntable.global_transform.origin.z < -20:
			rigidbody_turntable.queue_free()

	if player_ichuen_head_rigid.translation.y < -10 or player_ichuen_head_rigid.translation.z < -20 or player_ichuen_head_rigid.translation.x>=3 or player_ichuen_head_rigid.translation.x<=-3:
		player_ichuen_head_rigid.queue_free()
		new_player_ichuen_head_rigid()
	if player_mno_head_rigid.translation.y < -10 or player_mno_head_rigid.translation.z < -20 or player_mno_head_rigid.translation.x>=3 or player_mno_head_rigid.translation.x<=-3:
		player_mno_head_rigid.queue_free()
		new_player_mno_head_rigid()
	if player_olay_head_rigid.translation.y < -10 or player_olay_head_rigid.translation.z < -20 or player_olay_head_rigid.translation.x>=3 or player_olay_head_rigid.translation.x<=-3:
		player_olay_head_rigid.queue_free()
		new_player_olay_head_rigid()
	if player_speng_head_rigid.translation.y < -10 or player_speng_head_rigid.translation.z < -20 or player_speng_head_rigid.translation.x>=3 or player_speng_head_rigid.translation.x<=-3:
		player_speng_head_rigid.queue_free()
		new_player_speng_head_rigid()
	
func new_player_ichuen_head_rigid():
	player_ichuen_head_rigid = player_ichuen_head_rigid_c.instance()
	add_child(player_ichuen_head_rigid)
	player_ichuen_head_rigid.transform.origin = Vector3(rand_range(-2,2),5,-7)
#	player_ichuen_head_rigid.set_axis_velocity(Vector3(rand_range(-3,3),0,0))
	paticle_ichuen = player_ichuen_head_rigid.get_node("ICBd/CPUParticles")
	sfx_ichuen = player_ichuen_head_rigid.get_node("AudioStreamPlayer")
	animation_ichuen = player_ichuen_head_rigid.get_node("AnimationPlayer")
	animation_ichuen.play("idle")
	var __2 = animation_ichuen.connect("animation_finished",self,"_on_AnimationPlayer_ichuen")
	var __ = player_ichuen_head_rigid.connect("body_entered",self,"_on_player_ichuen_head_body_entered")

func new_player_mno_head_rigid():
	player_mno_head_rigid = player_mno_head_rigid_c.instance()
	add_child(player_mno_head_rigid)
	player_mno_head_rigid.transform.origin = Vector3(rand_range(-2,2),5,-7)
#	player_mno_head_rigid.set_axis_velocity(Vector3(rand_range(-3,3),0,0))
	paticle_mno = player_mno_head_rigid.get_node("mnoTrouser/CPUParticles")
	sfx_mno = player_mno_head_rigid.get_node("AudioStreamPlayer")
	animation_mno = player_mno_head_rigid.get_node("AnimationPlayer")
	animation_mno.play("idle")
	var __2 = animation_mno.connect("animation_finished",self,"_on_AnimationPlayer_mno")
	var __ = player_mno_head_rigid.connect("body_entered",self,"_on_player_mno_head_body_entered")
	
func new_player_olay_head_rigid():
	player_olay_head_rigid = player_olay_head_rigid_c.instance()
	add_child(player_olay_head_rigid)
	player_olay_head_rigid.transform.origin = Vector3(rand_range(-2,2),5,-7)
#	player_olay_head_rigid.set_axis_velocity(Vector3(rand_range(-3,3),0,0))
	paticle_olay = player_olay_head_rigid.get_node("OlayCap/CPUParticles")
	sfx_olay = player_olay_head_rigid.get_node("AudioStreamPlayer")
	animation_olay = player_olay_head_rigid.get_node("AnimationPlayer")
	animation_olay.play("idle")
	var __2 = animation_olay.connect("animation_finished",self,"_on_AnimationPlayer_olay")
	var __ = player_olay_head_rigid.connect("body_entered",self,"_on_player_olay_head_body_entered")
	
func new_player_speng_head_rigid():
	player_speng_head_rigid = player_speng_head_rigid_c.instance()
	add_child(player_speng_head_rigid)
	player_speng_head_rigid.transform.origin = Vector3(rand_range(-2,2),5,-7)
#	player_speng_head_rigid.set_axis_velocity(Vector3(rand_range(-3,3),0,0))
	paticle_speng = player_speng_head_rigid.get_node("SpeangBody/CPUParticles")
	sfx_speng = player_speng_head_rigid.get_node("AudioStreamPlayer")
	animation_speng = player_speng_head_rigid.get_node("AnimationPlayer")
	animation_speng.play("idle")
	var __2 = animation_speng.connect("animation_finished",self,"_on_AnimationPlayer_speng")
	var __ = player_speng_head_rigid.connect("body_entered",self,"_on_player_speng_head_body_entered")

func _on_player_ichuen_head_body_entered(body):
	if body.is_in_group("turntable"):
		Global.save_dict["ichuen_scores"]+=1
		paticle_ichuen.emitting = true
		animation_ichuen.play("head_rotation")
		sfx_ichuen.stream = sound_efx_ichuen[rand_range(0,sound_efx_ichuen.size())]
		sfx_ichuen.play()
		
func _on_player_mno_head_body_entered(body):
	if body.is_in_group("bass"):
		Global.save_dict["mno_scores"]+=1
		paticle_mno.emitting = true
		animation_mno.play("head_rotation")
		sfx_mno.stream = sound_efx_mno[rand_range(0,sound_efx_mno.size())]
		sfx_mno.play()
		
func _on_player_olay_head_body_entered(body):
	if body.is_in_group("drum"):
		Global.save_dict["olay_scores"]+=1
		paticle_olay.emitting = true
		animation_olay.play("head_rotation")
		sfx_olay.stream = sound_efx_olay[rand_range(0,sound_efx_olay.size())]
		sfx_olay.play()
		
func _on_player_speng_head_body_entered(body):
	if body.is_in_group("guitar"):
		Global.save_dict["speng_scores"]+=1
		paticle_speng.emitting = true
		animation_speng.play("head_rotation")
		sfx_speng.stream = sound_efx_speng[rand_range(0,sound_efx_speng.size())]
		sfx_speng.play()

func _on_AnimationPlayer_ichuen(_anim_name):
	paticle_ichuen.emitting = false
	animation_ichuen.play("idle")

func _on_AnimationPlayer_mno(_anim_name):
	paticle_mno.emitting = false
	animation_mno.play("idle")
	
func _on_AnimationPlayer_olay(_anim_name):
	paticle_olay.emitting = false
	animation_olay.play("idle")
	
func _on_AnimationPlayer_speng(_anim_name):
	paticle_speng.emitting = false
	animation_speng.play("idle")

func _input(event):
	var mouse_pos = get_viewport().get_mouse_position()
	var origin = $Camera.project_ray_origin(mouse_pos)
	var end = origin + $Camera.project_ray_normal(mouse_pos) * 3
	if Input.is_action_just_pressed("ui_click") and turntable_selected:
		rigidbody_turntable = rigidbody_turntable_c.instance()
		rigidbody_turntable.global_transform.origin = end
		add_child(rigidbody_turntable)
		var forward = rigidbody_turntable.get_global_transform().basis.z
		forward*=-1
		rigidbody_turntable.apply_central_impulse(forward*shoot_power)
		rigidbody_turntable.orthonormalize()
		
	if Input.is_action_just_pressed("ui_click") and bass_selected:
		rigidbody_bass = rigidbody_bass_c.instance()
		rigidbody_bass.global_transform.origin = end
		add_child(rigidbody_bass)
		var forward = rigidbody_bass.get_global_transform().basis.z
		forward*=-1
		rigidbody_bass.apply_central_impulse(forward*shoot_power)
		rigidbody_bass.orthonormalize()
		
	if Input.is_action_just_pressed("ui_click") and drum_selected:
		rigidbody_drum = rigidbody_drum_c.instance()
		rigidbody_drum.global_transform.origin = end
		add_child(rigidbody_drum)
		var forward = rigidbody_drum.get_global_transform().basis.z
		forward*=-1
		rigidbody_drum.apply_central_impulse(forward*shoot_power)
		rigidbody_drum.orthonormalize()
		
	if Input.is_action_just_pressed("ui_click") and guitar_selected:
		rigidbody_guitar = rigidbody_guitar_c.instance()
		rigidbody_guitar.global_transform.origin = end
		add_child(rigidbody_guitar)
		var forward = rigidbody_guitar.get_global_transform().basis.z
		forward*=-1
		rigidbody_guitar.apply_central_impulse(forward*shoot_power)
		rigidbody_guitar.orthonormalize()
		
func _on_turntable_button_pressed():
	$musical_HBoxContainer/turntable_button.disabled = true
	$musical_HBoxContainer/bass_button.disabled = false
	$musical_HBoxContainer/drum_button.disabled = false
	$musical_HBoxContainer/guitar_button.disabled = false
	turntable_selected = true
	bass_selected = false
	drum_selected = false
	guitar_selected = false
	$shoot3d_sound.stream = sound_bgm_shoot[3]
	$shoot3d_sound.play()

func _on_bass_button_pressed():
	$musical_HBoxContainer/turntable_button.disabled = false
	$musical_HBoxContainer/bass_button.disabled = true
	$musical_HBoxContainer/drum_button.disabled = false
	$musical_HBoxContainer/guitar_button.disabled = false
	turntable_selected = false
	bass_selected = true
	drum_selected = false
	guitar_selected = false
	$shoot3d_sound.stream = sound_bgm_shoot[0]
	$shoot3d_sound.play()

func _on_drum_button_pressed():
	$musical_HBoxContainer/turntable_button.disabled = false
	$musical_HBoxContainer/bass_button.disabled = false
	$musical_HBoxContainer/drum_button.disabled = true
	$musical_HBoxContainer/guitar_button.disabled = false
	turntable_selected = false
	bass_selected = false
	drum_selected = true
	guitar_selected = false
	$shoot3d_sound.stream = sound_bgm_shoot[1]
	$shoot3d_sound.play()

func _on_guitar_button_pressed():
	$musical_HBoxContainer/turntable_button.disabled = false
	$musical_HBoxContainer/bass_button.disabled = false
	$musical_HBoxContainer/drum_button.disabled = false
	$musical_HBoxContainer/guitar_button.disabled = true
	turntable_selected = false
	bass_selected = false
	drum_selected = false
	guitar_selected = true
	$shoot3d_sound.stream = sound_bgm_shoot[2]
	$shoot3d_sound.play()
		
func _on_home_button_pressed():
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")
func _on_home_button_mouse_entered():
	set_process_input(false)
func _on_home_button_mouse_exited():
	set_process_input(true)

func _on_turntable_button_mouse_entered():
	set_process_input(false)
func _on_bass_button_mouse_entered():
	set_process_input(false)
func _on_drum_button_mouse_entered():
	set_process_input(false)
func _on_guitar_button_mouse_entered():
	set_process_input(false)

func _on_turntable_button_mouse_exited():
	set_process_input(true)
func _on_bass_button_mouse_exited():
	set_process_input(true)
func _on_drum_button_mouse_exited():
	set_process_input(true)
func _on_guitar_button_mouse_exited():
	set_process_input(true)

func random_musical() -> void:
	var random_index = rand_range(0,musical_selected.size()-1)
	turntable_selected = musical_selected[random_index]
	musical_selected.remove(random_index)
	
	random_index = rand_range(0,musical_selected.size()-1)
	bass_selected = musical_selected[random_index]
	musical_selected.remove(random_index)
	
	random_index = rand_range(0,musical_selected.size()-1)
	drum_selected = musical_selected[random_index]
	musical_selected.remove(random_index)
	
	random_index = rand_range(0,musical_selected.size()-1)
	guitar_selected = musical_selected[random_index]
	musical_selected.remove(random_index)
	
	if turntable_selected:
		$musical_HBoxContainer/turntable_button.disabled= true
		$musical_HBoxContainer/bass_button.disabled = false
		$musical_HBoxContainer/drum_button.disabled = false
		$musical_HBoxContainer/guitar_button.disabled = false
		$shoot3d_sound.stream = sound_bgm_shoot[3]
	elif bass_selected:
		$musical_HBoxContainer/turntable_button.disabled = false
		$musical_HBoxContainer/bass_button.disabled = true
		$musical_HBoxContainer/drum_button.disabled = false
		$musical_HBoxContainer/guitar_button.disabled = false
		$shoot3d_sound.stream = sound_bgm_shoot[0]
	elif drum_selected:
		$musical_HBoxContainer/turntable_button.disabled = false
		$musical_HBoxContainer/bass_button.disabled = false
		$musical_HBoxContainer/drum_button.disabled = true
		$musical_HBoxContainer/guitar_button.disabled = false
		$shoot3d_sound.stream = sound_bgm_shoot[1]
	else:
		$musical_HBoxContainer/turntable_button.disabled = false
		$musical_HBoxContainer/bass_button.disabled = false
		$musical_HBoxContainer/drum_button.disabled = false
		$musical_HBoxContainer/guitar_button.disabled = true
		$shoot3d_sound.stream = sound_bgm_shoot[2]
