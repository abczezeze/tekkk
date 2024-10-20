extends Spatial
var is_dragging_ichuen:bool = false
var is_selected_ichuen:bool = false
var is_dragging_mno:bool = false
var is_selected_mno:bool = false
var is_dragging_olay:bool = false
var is_selected_olay:bool = false
var is_dragging_speng:bool = false
var is_selected_speng:bool = false

var rigidbody_turntable_c = preload("res://Scene/drag3d/rigidbody_turntable.tscn")
var rigidbody_turntable:RigidBody
var rigidbody_guitar_c = preload("res://Scene/drag3d/rigidbody_guitar.tscn")
var rigidbody_guitar:RigidBody
var rigidbody_drum_c = preload("res://Scene/drag3d/rigidbody_drum.tscn")
var rigidbody_drum:RigidBody
var rigidbody_bass_c = preload("res://Scene/drag3d/rigidbody_bass.tscn")
var rigidbody_bass:RigidBody

var random_index_mno:int
var random_index_speng:int
var random_index_ichuen:int
var random_index_olay:int
export (Array, Texture) var sprite_textures = []

func _ready():
	$AudioStreamPlayer.volume_db = Global.bgm_volume
	random_player()
	new_turntable()
	new_guitar()
	new_drum()
	new_bass()
	$dragScene.visible = true
	$dragScene.texture = sprite_textures[rand_range(1.0,sprite_textures.size())]
	$dragScene/AnimationPlayer.play("scaleBody")
	
func _physics_process(_delta):
	$score_vbox/ClickMno.text=str(Global.save_dict["mno_scores"])
	$score_vbox/ClickOlay.text=str(Global.save_dict["olay_scores"])
	$score_vbox/ClickIchuen.text=str(Global.save_dict["ichuen_scores"])
	$score_vbox/ClickSpeng.text=str(Global.save_dict["speng_scores"])
	$score_vbox/TotalScores.text=str(Global.total_scores)
	
	if rigidbody_turntable.transform.origin.y<-1:
		rigidbody_turntable.queue_free()
		new_turntable()
	if rigidbody_guitar.transform.origin.y<-1:
		rigidbody_guitar.queue_free()
		new_guitar()
	if rigidbody_drum.transform.origin.y<-1:
		rigidbody_drum.queue_free()
		new_drum()
	if rigidbody_bass.transform.origin.y<-1:
		rigidbody_bass.queue_free()
		new_bass()
		
func new_turntable():
	rigidbody_turntable = rigidbody_turntable_c.instance()
	add_child(rigidbody_turntable)
	rigidbody_turntable.transform.origin = Vector3(rand_range(-7,7),8,0)
	rigidbody_turntable.gravity_scale = rand_range(0.1,0.3)
	var __ = rigidbody_turntable.connect("body_entered",self,"on_turnatable_body_entered")

func on_turnatable_body_entered(body):
	if body.is_in_group("ichuen"):
		Global.save_dict["ichuen_scores"] += 1
		Global.AccurateAudioPlay()
	elif body.is_in_group("mno") or body.is_in_group("olay") or body.is_in_group("speng"):
		Global.FailedAudioPlay()
		Global.save_dict["ichuen_scores"] -= 1
		
func new_guitar():
	rigidbody_guitar = rigidbody_guitar_c.instance()
	add_child(rigidbody_guitar)
	rigidbody_guitar.transform.origin = Vector3(rand_range(-7,7),8,0)
	rigidbody_guitar.gravity_scale = rand_range(0.1,0.3)
	var __ = rigidbody_guitar.connect("body_entered",self,"on_guitar_body_entered")

func on_guitar_body_entered(body):
	if body.is_in_group("speng"):
		Global.save_dict["speng_scores"] += 1
		Global.AccurateAudioPlay()
	elif body.is_in_group("mno") or body.is_in_group("olay") or body.is_in_group("ichuen"):
		Global.FailedAudioPlay()
		Global.save_dict["speng_scores"] -= 1

func new_drum():
	rigidbody_drum = rigidbody_drum_c.instance()
	add_child(rigidbody_drum)
	rigidbody_drum.transform.origin = Vector3(rand_range(-7,7),8,0)
	rigidbody_drum.gravity_scale = rand_range(0.1,0.3)
	var __ = rigidbody_drum.connect("body_entered",self,"on_drum_body_entered")

func on_drum_body_entered(body):
	if body.is_in_group("olay"):
		Global.save_dict["olay_scores"] += 1
		Global.AccurateAudioPlay()
	elif body.is_in_group("mno") or body.is_in_group("ichuen") or body.is_in_group("speng"):
		Global.FailedAudioPlay()
		Global.save_dict["olay_scores"] -= 1
	
func new_bass():
	rigidbody_bass = rigidbody_bass_c.instance()
	add_child(rigidbody_bass)
	rigidbody_bass.transform.origin = Vector3(rand_range(-7,7),8,0)
	rigidbody_bass.gravity_scale = rand_range(0.1,0.3)
	var __ = rigidbody_bass.connect("body_entered",self,"on_bass_body_entered")

func on_bass_body_entered(body):
	if body.is_in_group("mno"):
		Global.save_dict["mno_scores"] += 1
		Global.AccurateAudioPlay()
	elif body.is_in_group("ichuen") or body.is_in_group("olay") or body.is_in_group("speng"):
		Global.FailedAudioPlay()
		Global.save_dict["mno_scores"] -= 1

func _input(event: InputEvent) -> void:
	if not is_dragging_ichuen and is_selected_ichuen:
		return
	if not is_dragging_mno and is_selected_mno:
		return
	if not is_dragging_olay and is_selected_olay:
		return
	if not is_dragging_speng and is_selected_speng: 
		return
	
	if Input.is_action_just_released("ui_click"):
		is_dragging_ichuen = false
		is_dragging_mno = false
		is_dragging_olay = false
		is_dragging_speng = false
		is_selected_ichuen = false
		is_selected_mno = false
		is_selected_olay = false
		is_selected_speng = false
		
	if is_dragging_ichuen and event is InputEventMouseMotion:
		var mouse_pos = get_viewport().get_mouse_position()
		var origin = $Camera.project_ray_origin(mouse_pos)
		var end = $Camera.project_ray_normal(mouse_pos)
		var depth = origin.distance_to($player_ichuen_full.transform.origin)
		var final_pos = origin + end * depth
		$player_ichuen_full.transform.origin.x = final_pos.x
		
		if $player_ichuen_full.transform.origin.x<=-7:
			$player_ichuen_full.transform.origin.x=-7
		elif $player_ichuen_full.transform.origin.x>=7:
			$player_ichuen_full.transform.origin.x=7
			
	if is_dragging_mno and event is InputEventMouseMotion:
		var mouse_pos = get_viewport().get_mouse_position()
		var origin = $Camera.project_ray_origin(mouse_pos)
		var end = $Camera.project_ray_normal(mouse_pos)
		var depth = origin.distance_to($player_mno_full.transform.origin)
		var final_pos = origin + end * depth
		$player_mno_full.transform.origin.x = final_pos.x
		if $player_mno_full.transform.origin.x<=-7:
			$player_mno_full.transform.origin.x=-7
		elif $player_mno_full.transform.origin.x>=7:
			$player_mno_full.transform.origin.x=7
			
	if is_dragging_olay and event is InputEventMouseMotion:
		var mouse_pos = get_viewport().get_mouse_position()
		var origin = $Camera.project_ray_origin(mouse_pos)
		var end = $Camera.project_ray_normal(mouse_pos)
		var depth = origin.distance_to($player_mno_full.transform.origin)
		var final_pos = origin + end * depth
		$player_olay_full.transform.origin.x = final_pos.x
		if $player_olay_full.transform.origin.x<=-7:
			$player_olay_full.transform.origin.x=-7
		elif $player_olay_full.transform.origin.x>=7:
			$player_olay_full.transform.origin.x=7
			
	if is_dragging_speng and event is InputEventMouseMotion:
		var mouse_pos = get_viewport().get_mouse_position()
		var origin = $Camera.project_ray_origin(mouse_pos)
		var end = $Camera.project_ray_normal(mouse_pos)
		var depth = origin.distance_to($player_speng_full.transform.origin)
		var final_pos = origin + end * depth
		$player_speng_full.transform.origin.x = final_pos.x
		if $player_speng_full.transform.origin.x<=-7:
			$player_speng_full.transform.origin.x=-7
		elif $player_speng_full.transform.origin.x>=7:
			$player_speng_full.transform.origin.x=7

func _on_player_ichuen_full_input_event(_camera, event, _position, _normal, _shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging_ichuen = true
		is_dragging_mno = false
		is_dragging_olay = false
		is_dragging_speng = false
		
func _on_player_mno_full_input_event(_camera, event, _position, _normal, _shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging_mno = true
		is_dragging_ichuen = false
		is_dragging_olay = false
		is_dragging_speng = false
		
func _on_player_olay_full_input_event(_camera, event, _position, _normal, _shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging_olay = true
		is_dragging_mno = false
		is_dragging_ichuen = false
		is_dragging_speng = false
		
func _on_player_speng_full_input_event(_camera, event, _position, _normal, _shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging_speng = true
		is_dragging_mno = false
		is_dragging_olay = false
		is_dragging_ichuen = false
		
func random_player() -> void:
	if is_selected_ichuen:
		_on_ichuen_button_pressed()
	elif is_selected_mno:
		_on_mno_button_pressed()
	elif is_selected_olay:
		_on_olay_button_pressed()
	else:
		_on_speng_button_pressed()

func _on_ichuen_button_pressed():
	$player_full_hbox/ichuen_button.disabled= true
	$player_full_hbox/mno_button.disabled = false
	$player_full_hbox/olay_button.disabled = false
	$player_full_hbox/speng_button.disabled = false
	$player_ichuen_full.transform.origin.x = 0
	$player_olay_full.transform.origin.x = 10
	$player_mno_full.transform.origin.x = 10
	$player_speng_full.transform.origin.x = 10
	$WorldEnvironment.environment.background_sky.sky_top_color = Color(0.41,0.05,0.58,1)

func _on_mno_button_pressed():
	$player_full_hbox/ichuen_button.disabled = false
	$player_full_hbox/mno_button.disabled = true
	$player_full_hbox/olay_button.disabled = false
	$player_full_hbox/speng_button.disabled = false
	$player_ichuen_full.transform.origin.x = 10
	$player_olay_full.transform.origin.x = 10
	$player_mno_full.transform.origin.x = 0
	$player_speng_full.transform.origin.x = 10
	$WorldEnvironment.environment.background_sky.sky_top_color = Color(1,0.51,0,1)

func _on_olay_button_pressed():
	$player_full_hbox/ichuen_button.disabled = false
	$player_full_hbox/mno_button.disabled = false
	$player_full_hbox/olay_button.disabled = true
	$player_full_hbox/speng_button.disabled = false
	$player_ichuen_full.transform.origin.x = 10
	$player_olay_full.transform.origin.x = 0
	$player_mno_full.transform.origin.x = 10
	$player_speng_full.transform.origin.x = 10
	$WorldEnvironment.environment.background_sky.sky_top_color = Color(0,0.46,1,1)

func _on_speng_button_pressed():
	$player_full_hbox/ichuen_button.disabled = false
	$player_full_hbox/mno_button.disabled = false
	$player_full_hbox/olay_button.disabled = false
	$player_full_hbox/speng_button.disabled = true
	$player_ichuen_full.transform.origin.x = 10
	$player_olay_full.transform.origin.x = 10
	$player_mno_full.transform.origin.x = 10
	$player_speng_full.transform.origin.x = 0
	$WorldEnvironment.environment.background_sky.sky_top_color = Color(0.95,1,0,1)

func _on_home_button_pressed():
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")


func _on_AnimationPlayer_animation_finished(_anim_name):
	$dragScene/AnimationPlayer.play("RotateLight")
