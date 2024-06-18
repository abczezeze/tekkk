extends Spatial
var clicked_speng:bool = false
onready var anim_speng:AnimationPlayer = $player_ichuen_head/AnimationPlayer
export (Array,AudioStreamOGGVorbis) var sound_efx_speng = []

func _ready():
	Global.position_z_click3d = $Camera.transform.origin.z
	Global.world_environment_scene_a = $WorldEnvironment
	
#	anim_speng.play("idle")
	$player_speng_head/AnimationPlayer.play("idle")
	$player_speng_head/Label3D.text = str(Global.save_dict["speng_scores"])
	$player_speng_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-21)
	var __0 = $player_speng_head.connect("input_event",self,"_on_player_speng_head_input_event")
	var __1 = $player_speng_head/AnimationPlayer.connect("animation_finished",self,"_on_AnimationPlayer_speng_anim_finished")
	var __2 = $player_speng_head/Timer.connect("timeout",self,"_on_Timer_timeout")
		
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

func _on_player_speng_head_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click") and not clicked_speng and $Camera.transform.origin.z == -15:
			$player_speng_head/AnimationPlayer.play("head_rotation")
			clicked_speng = true
			$player_speng_head/Timer.wait_time-=0.2
			if $player_speng_head/Timer.wait_time<=0:
				$player_speng_head/Timer.wait_time = 1
			Global.save_dict["speng_scores"]+=1
			Global.save_game()
			$player_speng_head/SpeangBody/CPUParticles.emitting = true
			$player_speng_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-21)
			$player_speng_head/Label3D.text = str(Global.save_dict["speng_scores"])
			$player_speng_head/AudioStreamPlayer.stream = sound_efx_speng[rand_range(0,sound_efx_speng.size())]
			$player_speng_head/AudioStreamPlayer.stream.loop = false
			$player_speng_head/AudioStreamPlayer.play()

func _on_AnimationPlayer_speng_anim_finished(_anim_name):
	$player_speng_head/SpeangBody/CPUParticles.emitting = false
	clicked_speng = false
	$player_speng_head/AnimationPlayer.play("idle")

func _on_Timer_timeout():
	$player_speng_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-21)
		
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
