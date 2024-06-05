extends Spatial

func _ready():
	Global.camera_scene_a = $Camera
	$click3d_sound.play()

func _process(delta):
	pass


func _on_HomeBT_pressed():
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")
	Global.HomeAudioPlay()
	$click3d_sound.stop()


func _on_player_ichuen_head_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click"):
			$WorldEnvironment.environment.background_sky.sky_top_color = Color(0.41,0.05,0.58,1)


func _on_player_mno_head_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click"):
			$WorldEnvironment.environment.background_sky.sky_top_color = Color(1,0.51,0,1)
			


func _on_player_olay_head_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click"):
			$WorldEnvironment.environment.background_sky.sky_top_color = Color(0,0.46,1,1)


func _on_player_speng_head_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click"):
			$WorldEnvironment.environment.background_sky.sky_top_color = Color(0.95,1,0,1)
