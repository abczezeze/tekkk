extends Spatial

func _ready():
	Global.camera_scene_a = $Camera
#	$Home.get_tree().change_scene("res://Scene/MainMenu.tscn")
#	$WorldEnvironment.environment.background_sky.sky_horizon_color = Color(0.05,0.28,0.58,1) 

func _process(delta):
	pass


func _on_HomeBT_pressed():
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")
	Global.HomeAudioPlay()
	Global.FloatingStop()
