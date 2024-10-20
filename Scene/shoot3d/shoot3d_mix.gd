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
#var animation_ichuen:AnimationPlayer
var sfx_ichuen:AudioStreamPlayer
var paticle_ichuen:CPUParticles

var player_mno_head_rigid_c:PackedScene = preload("res://Scene/shoot3d/player_mno_head_rigid.tscn")
var player_mno_head_rigid:RigidBody
#var animation_mno:AnimationPlayer
var sfx_mno:AudioStreamPlayer
var paticle_mno:CPUParticles

var player_olay_head_rigid_c:PackedScene = preload("res://Scene/shoot3d/player_olay_head_rigid.tscn")
var player_olay_head_rigid:RigidBody
#var animation_olay:AnimationPlayer
var sfx_olay:AudioStreamPlayer
var paticle_olay:CPUParticles

var player_speng_head_rigid_c:PackedScene = preload("res://Scene/shoot3d/player_speng_head_rigid.tscn")
var player_speng_head_rigid:RigidBody
#var animation_speng:AnimationPlayer
var sfx_speng:AudioStreamPlayer
var paticle_speng:CPUParticles

export (Array,AudioStreamOGGVorbis) var sound_sfx_ichuen = []
export (Array,AudioStreamOGGVorbis) var sound_sfx_mno = []
export (Array,AudioStreamOGGVorbis) var sound_sfx_olay = []
export (Array,AudioStreamOGGVorbis) var sound_sfx_speng = []

export (Array,AudioStreamMP3) var sound_bgm_shoot = []

var turntable_selected:bool = false
var bass_selected:bool = false
var drum_selected:bool = false
var guitar_selected:bool = false
var musical_selected:Array = [true,false,false,false]

var mouse_positon:Vector2 = Vector2()
var shoot_power:int = 50

export (Array, Texture) var sprite_textures = []

const KILL_TIMER = 10
var timer = 0

func _ready():
	$shoot3d_sound.volume_db = Global.bgm_volume
	new_player_ichuen_head_rigid()
	new_player_mno_head_rigid()
	new_player_olay_head_rigid()
	new_player_speng_head_rigid()
	
	random_musical()
	$shoot3d_sound.play()
	
	$shootScene.texture = sprite_textures[rand_range(1.0,4.0)]
	$shootScene/AnimationPlayer.play("scaleMusical")
	
func _physics_process(delta):
	$score_vbox/ClickMno.text=str(Global.save_dict["mno_scores"])
	$score_vbox/ClickOlay.text=str(Global.save_dict["olay_scores"])
	$score_vbox/ClickIchuen.text=str(Global.save_dict["ichuen_scores"])
	$score_vbox/ClickSpeng.text=str(Global.save_dict["speng_scores"])
	$score_vbox/TotalScores.text=str(Global.total_scores)
	
	timer += delta
	if is_instance_valid(rigidbody_turntable):
		if timer >= KILL_TIMER:
			rigidbody_turntable.queue_free()
			timer=0
	if is_instance_valid(rigidbody_turntable):
		if timer >= KILL_TIMER:
			rigidbody_turntable.queue_free()
			timer=0
	if is_instance_valid(rigidbody_turntable):
		if timer >= KILL_TIMER:
			rigidbody_turntable.queue_free()
			timer=0
	if is_instance_valid(rigidbody_turntable):
		if timer >= KILL_TIMER:
			rigidbody_turntable.queue_free()
			timer=0

	var ichuen_check_y = player_ichuen_head_rigid.translation.y < -10
	var ichuen_check_z = player_ichuen_head_rigid.translation.z < -20
	if ichuen_check_y or ichuen_check_z:
		player_ichuen_head_rigid.queue_free()
		new_player_ichuen_head_rigid()
		
	var mno_check_y = player_mno_head_rigid.translation.y < -10
	var mno_check_z = player_mno_head_rigid.translation.z < -20
	if mno_check_y or mno_check_z:
		player_mno_head_rigid.queue_free()
		new_player_mno_head_rigid()
		
	var olay_check_y = player_olay_head_rigid.translation.y < -10
	var olay_check_z = player_olay_head_rigid.translation.z < -20
	if olay_check_y or olay_check_z:
		player_olay_head_rigid.queue_free()
		new_player_olay_head_rigid()
		
	var speng_check_y = player_speng_head_rigid.translation.y < -10
	var speng_check_z = player_speng_head_rigid.translation.z < -20
	if speng_check_y or speng_check_z:
		player_speng_head_rigid.queue_free()
		new_player_speng_head_rigid()
		
func new_player_ichuen_head_rigid():
	player_ichuen_head_rigid = player_ichuen_head_rigid_c.instance()
	add_child(player_ichuen_head_rigid)
	player_ichuen_head_rigid.transform.origin = Vector3(rand_range(-8,8),5,-7)
	sfx_ichuen = player_ichuen_head_rigid.get_node("AudioStreamPlayer")
	sfx_ichuen.volume_db = Global.sfx_volume
#	animation_ichuen = player_ichuen_head_rigid.get_node("AnimationPlayer")
#	var __2 = animation_ichuen.connect("animation_finished",self,"_on_AnimationPlayer_ichuen")
	var __ = player_ichuen_head_rigid.connect("body_entered",self,"_on_player_ichuen_head_body_entered")

func new_player_mno_head_rigid():
	player_mno_head_rigid = player_mno_head_rigid_c.instance()
	add_child(player_mno_head_rigid)
	player_mno_head_rigid.transform.origin = Vector3(rand_range(-8,8),5,-7)
	sfx_mno = player_mno_head_rigid.get_node("AudioStreamPlayer")
	sfx_mno.volume_db = Global.sfx_volume
#	animation_mno = player_mno_head_rigid.get_node("AnimationPlayer")
#	var __2 = animation_mno.connect("animation_finished",self,"_on_AnimationPlayer_mno")
	var __ = player_mno_head_rigid.connect("body_entered",self,"_on_player_mno_head_body_entered")
	
func new_player_olay_head_rigid():
	player_olay_head_rigid = player_olay_head_rigid_c.instance()
	add_child(player_olay_head_rigid)
	player_olay_head_rigid.transform.origin = Vector3(rand_range(-8,8),5,-7)
	sfx_olay = player_olay_head_rigid.get_node("AudioStreamPlayer")
	sfx_olay.volume_db = Global.sfx_volume
#	animation_olay = player_olay_head_rigid.get_node("AnimationPlayer")
#	var __2 = animation_olay.connect("animation_finished",self,"_on_AnimationPlayer_olay")
	var __ = player_olay_head_rigid.connect("body_entered",self,"_on_player_olay_head_body_entered")
	
func new_player_speng_head_rigid():
	player_speng_head_rigid = player_speng_head_rigid_c.instance()
	add_child(player_speng_head_rigid)
	player_speng_head_rigid.transform.origin = Vector3(rand_range(-8,8),5,-7)
	sfx_speng = player_speng_head_rigid.get_node("AudioStreamPlayer")
	sfx_speng.volume_db = Global.sfx_volume
#	animation_speng = player_speng_head_rigid.get_node("AnimationPlayer")
#	var __2 = animation_speng.connect("animation_finished",self,"_on_AnimationPlayer_speng")
	var __ = player_speng_head_rigid.connect("body_entered",self,"_on_player_speng_head_body_entered")

func _on_player_ichuen_head_body_entered(body):
	if body.is_in_group("turntable"):
		Global.save_dict["ichuen_scores"]+=1
#		animation_ichuen.play("head_rotation")
		sfx_ichuen.stream = sound_sfx_ichuen[rand_range(0,sound_sfx_ichuen.size())]
		sfx_ichuen.play()
	elif body.is_in_group("bass") or body.is_in_group("drum") or body.is_in_group("guitar"):
		Global.FailedAudioPlay()
		Global.save_dict["ichuen_scores"] -= 1
		
func _on_player_mno_head_body_entered(body):
	if body.is_in_group("bass"):
		Global.save_dict["mno_scores"]+=1
#		animation_mno.play("head_rotation")
		sfx_mno.stream = sound_sfx_mno[rand_range(0,sound_sfx_mno.size())]
		sfx_mno.play()
	elif body.is_in_group("turntable") or body.is_in_group("drum") or body.is_in_group("guitar"):
		Global.FailedAudioPlay()
		Global.save_dict["mno_scores"] -= 1
		
func _on_player_olay_head_body_entered(body):
	if body.is_in_group("drum"):
		Global.save_dict["olay_scores"]+=1
#		animation_olay.play("head_rotation")
		sfx_olay.stream = sound_sfx_olay[rand_range(0,sound_sfx_olay.size())]
		sfx_olay.play()
	elif body.is_in_group("bass") or body.is_in_group("turntable") or body.is_in_group("guitar"):
		Global.FailedAudioPlay()
		Global.save_dict["olay_scores"] -= 1
		
func _on_player_speng_head_body_entered(body):
	if body.is_in_group("guitar"):
		Global.save_dict["speng_scores"]+=1
#		animation_speng.play("head_rotation")
		sfx_speng.stream = sound_sfx_speng[rand_range(0,sound_sfx_speng.size())]
		sfx_speng.play()
	elif body.is_in_group("bass") or body.is_in_group("drum") or body.is_in_group("turntable"):
		Global.FailedAudioPlay()
		Global.save_dict["speng_scores"] -= 1

#func _on_AnimationPlayer_ichuen(_anim_name):
#	animation_ichuen.play("idle")
#
#func _on_AnimationPlayer_mno(_anim_name):
#	animation_mno.play("idle")
#
#func _on_AnimationPlayer_olay(_anim_name):
#	animation_olay.play("idle")
#
#func _on_AnimationPlayer_speng(_anim_name):
#	animation_speng.play("idle")

func _input(_event):
	var mouse_pos = get_viewport().get_mouse_position()
	var origin = $Camera.project_ray_origin(mouse_pos)
	var end = origin + $Camera.project_ray_normal(mouse_pos)
	if Input.is_action_just_pressed("ui_click") and turntable_selected:
		var depth = origin.distance_to(player_ichuen_head_rigid.global_transform.origin)
		var final_pos = origin + end * depth
		rigidbody_turntable = rigidbody_turntable_c.instance()
		rigidbody_turntable.global_transform.origin = final_pos
		add_child(rigidbody_turntable)
		var forward = rigidbody_turntable.get_global_transform().basis.z
		forward*=-1
		rigidbody_turntable.apply_central_impulse(forward*shoot_power)
		rigidbody_turntable.orthonormalize()
		
	if Input.is_action_just_pressed("ui_click") and bass_selected:
		var depth = origin.distance_to(player_mno_head_rigid.global_transform.origin)
		var final_pos = origin + end * depth
		rigidbody_bass = rigidbody_bass_c.instance()
		rigidbody_bass.global_transform.origin = final_pos
		add_child(rigidbody_bass)
		var forward = rigidbody_bass.get_global_transform().basis.z
		forward*=-1
		rigidbody_bass.apply_central_impulse(forward*shoot_power)
		rigidbody_bass.orthonormalize()
		
	if Input.is_action_just_pressed("ui_click") and drum_selected:
		var depth = origin.distance_to(player_olay_head_rigid.global_transform.origin)
		var final_pos = origin + end * depth
		rigidbody_drum = rigidbody_drum_c.instance()
		rigidbody_drum.global_transform.origin = final_pos
		add_child(rigidbody_drum)
		var forward = rigidbody_drum.get_global_transform().basis.z
		forward*=-1
		rigidbody_drum.apply_central_impulse(forward*shoot_power)
		rigidbody_drum.orthonormalize()
		
	if Input.is_action_just_pressed("ui_click") and guitar_selected:
		var depth = origin.distance_to(player_speng_head_rigid.global_transform.origin)
		var final_pos = origin + end * depth
		rigidbody_guitar = rigidbody_guitar_c.instance()
		rigidbody_guitar.global_transform.origin = final_pos
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
	$WorldEnvironment.environment.background_sky.sky_top_color = Color(0.41,0.05,0.58,1)

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
	$WorldEnvironment.environment.background_sky.sky_top_color = Color(1,0.51,0,1)

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
	$WorldEnvironment.environment.background_sky.sky_top_color = Color(0,0.46,1,1)

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
	$WorldEnvironment.environment.background_sky.sky_top_color = Color(0.95,1,0,1)
		
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
		$WorldEnvironment.environment.background_sky.sky_top_color = Color(0.41,0.05,0.58,1)
	elif bass_selected:
		$musical_HBoxContainer/turntable_button.disabled = false
		$musical_HBoxContainer/bass_button.disabled = true
		$musical_HBoxContainer/drum_button.disabled = false
		$musical_HBoxContainer/guitar_button.disabled = false
		$shoot3d_sound.stream = sound_bgm_shoot[0]
		$WorldEnvironment.environment.background_sky.sky_top_color = Color(1,0.51,0,1)
	elif drum_selected:
		$musical_HBoxContainer/turntable_button.disabled = false
		$musical_HBoxContainer/bass_button.disabled = false
		$musical_HBoxContainer/drum_button.disabled = true
		$musical_HBoxContainer/guitar_button.disabled = false
		$shoot3d_sound.stream = sound_bgm_shoot[1]
		$WorldEnvironment.environment.background_sky.sky_top_color = Color(0,0.46,1,1)
	else:
		$musical_HBoxContainer/turntable_button.disabled = false
		$musical_HBoxContainer/bass_button.disabled = false
		$musical_HBoxContainer/drum_button.disabled = false
		$musical_HBoxContainer/guitar_button.disabled = true
		$shoot3d_sound.stream = sound_bgm_shoot[2]
		$WorldEnvironment.environment.background_sky.sky_top_color = Color(0.95,1,0,1)


func _on_AnimationPlayer_animation_finished(anim_name):
	$shootScene/AnimationPlayer.play("RotateLight")
