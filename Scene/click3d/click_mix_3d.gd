extends Spatial

func _ready():
	Global.camera_scene_a = $Camera
	$WorldEnvironment.environment.background_sky.sky_horizon_color = Color(0.05,0.28,0.58,1) 

func _process(delta):
	pass
