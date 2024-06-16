extends Spatial
var random_position_z:Array = [0,-10]

func _ready():
	Global.position_z_click3d = $Camera.transform.origin.z
	Global.world_environment_scene_a = $WorldEnvironment
		
func _process(_delta):
	if Global.position_z_click3d == 6:
		$WorldEnvironment.environment.background_sky.sky_top_color = Color(0.41,0.05,0.58,1)
	elif Global.position_z_click3d == -1:
		$WorldEnvironment.environment.background_sky.sky_top_color = Color(1,0.51,0,1)
	elif Global.position_z_click3d == -8:
		$WorldEnvironment.environment.background_sky.sky_top_color = Color(0,0.46,1,1)
	elif Global.position_z_click3d == -15:
		$WorldEnvironment.environment.background_sky.sky_top_color = Color(0.95,1,0,1)
	else:
		$WorldEnvironment.environment.background_sky.sky_top_color = Color(0,0,0,1)
		
func _on_HomeBT_pressed():
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")
	Global.HomeAudioPlay()
	$click3d_sound.stop()

func _on_TextureButton_up_pressed():
	$Camera.transform.origin.z -= 7 
	Global.position_z_click3d = $Camera.transform.origin.z

func _on_TextureButton_down_pressed():
	$Camera.transform.origin.z += 7 
	Global.position_z_click3d = $Camera.transform.origin.z
