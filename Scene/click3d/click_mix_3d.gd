extends Spatial
var clicked_speng:bool = false
export (Array,AudioStreamOGGVorbis) var sound_efx_speng = []

var dir_x_ichuen:float = 0.1
var dir_y_ichuen:float = 0.1
var move_speed_ichuen:float = 1
var clicked_ichuen:bool = false
export (Array,AudioStreamOGGVorbis) var sound_efx_ichuen = []

var dir_x_mno:float = 0.1
var move_speed_mno:float = 1
var clicked_mno:bool = false
export (Array,AudioStreamOGGVorbis) var sound_efx_mno = []

var dir_y_olay:float = 0.1
var move_speed_olay:float = 1
var clicked_olay:bool = false
export (Array,AudioStreamOGGVorbis) var sound_efx_olay = []

func _ready():
	$player_speng_head/AnimationPlayer.play("idle")
	$player_speng_head/Label3D.text = str(Global.save_dict["speng_scores"])
	$player_speng_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-21)
	var __0 = $player_speng_head.connect("input_event",self,"_on_player_speng_head_input_event")
	var __1 = $player_speng_head/AnimationPlayer.connect("animation_finished",self,"_on_AnimationPlayer_speng")
	var __2 = $player_speng_head/Timer.connect("timeout",self,"_on_Timer_timeout")
	
	$player_ichuen_head/AnimationPlayer.play("idle")
	dir_x_ichuen = rand_range(-1,1)
	dir_y_ichuen = rand_range(-1,1)
	$player_ichuen_head/Label3D.text = str(Global.save_dict["ichuen_scores"])
	$player_ichuen_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),0)
	var __3 = $player_ichuen_head.connect("input_event",self,"_on_player_ichuen_head_input_event")
	var __4 = $player_ichuen_head/AnimationPlayer.connect("animation_finished",self,"_on_AnimationPlayer_ichuen")
	
	$player_mno_head/AnimationPlayer.play("idle")
	dir_x_mno = rand_range(-2,2)
	$player_mno_head/Label3D.text = str(Global.save_dict["mno_scores"])
	$player_mno_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-6)
	var __5 = $player_mno_head.connect("input_event",self,"_on_player_mno_head_input_event")
	var __6 = $player_mno_head/AnimationPlayer.connect("animation_finished",self,"_on_AnimationPlayer_mno")
	
	$player_olay_head/AnimationPlayer.play("idle")
	dir_y_olay = rand_range(-2,2)
	$player_olay_head/Label3D.text = str(Global.save_dict["olay_scores"])
	$player_olay_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-14)
	var __7 = $player_olay_head.connect("input_event",self,"_on_player_olay_head_input_event")
	var __8 = $player_olay_head/AnimationPlayer.connect("animation_finished",self,"_on_AnimationPlayer_olay")
		
func _process(delta):
	 #check camera transform z axis
	if $Camera.transform.origin.z == 6:
		$VBoxContainer/TextureButton_up.disabled = false
		$VBoxContainer/TextureButton_down.disabled = true
		$WorldEnvironment.environment.background_sky.sky_top_color = Color(0.41,0.05,0.58,1)
	elif $Camera.transform.origin.z == -1:
		$VBoxContainer/TextureButton_up.disabled = false
		$VBoxContainer/TextureButton_down.disabled = false
		$WorldEnvironment.environment.background_sky.sky_top_color = Color(1,0.51,0,1)
	elif $Camera.transform.origin.z == -8:
		$VBoxContainer/TextureButton_up.disabled = false
		$VBoxContainer/TextureButton_down.disabled = false
		$WorldEnvironment.environment.background_sky.sky_top_color = Color(0,0.46,1,1)
	elif $Camera.transform.origin.z == -15:
		$VBoxContainer/TextureButton_up.disabled = true
		$VBoxContainer/TextureButton_down.disabled = false
		$WorldEnvironment.environment.background_sky.sky_top_color = Color(0.95,1,0,1)
	else:
		$WorldEnvironment.environment.background_sky.sky_top_color = Color(0,0,0,1)
		$VBoxContainer/TextureButton_up.disabled = true
		$VBoxContainer/TextureButton_down.disabled = true
	#ichuen move
	$player_ichuen_head.translation += Vector3(dir_x_ichuen*move_speed_ichuen*delta,dir_y_ichuen*move_speed_ichuen*delta,0)
	if $player_ichuen_head.transform.origin.x>2:
		dir_x_ichuen = rand_range(-1,0)
		$player_ichuen_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),0)
	elif $player_ichuen_head.transform.origin.x<-2:
		dir_x_ichuen = rand_range(0,1)
		$player_ichuen_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),0)
		
	if $player_ichuen_head.transform.origin.y>4:
		dir_y_ichuen = rand_range(-1,0)
		$player_ichuen_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),0)
	elif $player_ichuen_head.transform.origin.y<-4:
		dir_y_ichuen = rand_range(0,1)
		$player_ichuen_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),0)
	#mno move
	$player_mno_head.translation.x += dir_x_mno*move_speed_mno*delta
	if $player_mno_head.transform.origin.x>2:
		dir_x_mno = rand_range(-2,0)
		$player_mno_head.transform.origin = Vector3(1,rand_range(-3,3),-6)
	elif $player_mno_head.transform.origin.x<-2:
		dir_x_mno = rand_range(0,2)
		$player_mno_head.transform.origin = Vector3(-1,rand_range(-3,3),-6)
	#olay move
	$player_olay_head.translation.y += dir_y_olay*move_speed_olay*delta
	if $player_olay_head.transform.origin.y>4:
		dir_y_olay = rand_range(-2,0)
		$player_olay_head.transform.origin = Vector3(rand_range(-2,2),4,-14)
	elif $player_olay_head.transform.origin.y<-4:
		dir_y_olay = rand_range(0,2)
		$player_olay_head.transform.origin = Vector3(rand_range(-2,2),-4,-14)

func _on_AnimationPlayer_ichuen(_anim_name):
	$player_ichuen_head/ICBd/CPUParticles.emitting = false
	clicked_ichuen = false
	$player_ichuen_head/AnimationPlayer.play("idle")
	
func _on_AnimationPlayer_mno(_anim_name):
	$player_mno_head/mnoTrouser/CPUParticles.emitting = false
	clicked_mno = false
	$player_mno_head/AnimationPlayer.play("idle")
	
func _on_AnimationPlayer_olay(_anim_name):
	$player_olay_head/OlayCap/CPUParticles.emitting = false
	clicked_olay = false
	$player_olay_head/AnimationPlayer.play("idle")

func _on_player_ichuen_head_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click") and not clicked_ichuen and $Camera.transform.origin.z == 6:
			$player_ichuen_head/AnimationPlayer.play("head_rotation")
			move_speed_ichuen+=0.3
			clicked_ichuen = true
			Global.save_dict["ichuen_scores"]+=1
			Global.save_game()
			$player_ichuen_head/ICBd/CPUParticles.emitting = true
			$player_ichuen_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),0)
			$player_ichuen_head/Label3D.text = str(Global.save_dict["ichuen_scores"])
			$player_ichuen_head/AudioStreamPlayer.stream = sound_efx_ichuen[rand_range(0,sound_efx_ichuen.size())]
			$player_ichuen_head/AudioStreamPlayer.stream.loop = false
			$player_ichuen_head/AudioStreamPlayer.play()
			
func _on_player_mno_head_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click") and not clicked_mno and $Camera.transform.origin.z == -1:
			$player_mno_head/AnimationPlayer.play("head_rotation")
			move_speed_mno+=0.3
			clicked_mno = true
			Global.save_dict["mno_scores"]+=1
			Global.save_game()
			$player_mno_head/mnoTrouser/CPUParticles.emitting = true
			$player_mno_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-6)
			$player_mno_head/Label3D.text = str(Global.save_dict["mno_scores"])
			$player_mno_head/AudioStreamPlayer.stream = sound_efx_mno[rand_range(0,sound_efx_mno.size())]
			$player_mno_head/AudioStreamPlayer.stream.loop = false
			$player_mno_head/AudioStreamPlayer.play()
			
func _on_player_olay_head_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click") and not clicked_olay and $Camera.transform.origin.z == -8:
			$player_olay_head/AnimationPlayer.play("head_rotation")
			move_speed_olay+=0.3
			clicked_olay = true
			Global.save_dict["olay_scores"]+=1
			Global.save_game()
			$player_olay_head/OlayCap/CPUParticles.emitting = true
			$player_olay_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-14)
			$player_olay_head/Label3D.text = str(Global.save_dict["olay_scores"])
			$player_olay_head/AudioStreamPlayer.stream = sound_efx_olay[rand_range(0,sound_efx_olay.size())]
			$player_olay_head/AudioStreamPlayer.stream.loop = false
			$player_olay_head/AudioStreamPlayer.play()

func _on_player_speng_head_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click") and not clicked_speng and $Camera.transform.origin.z == -15:
			$player_speng_head/AnimationPlayer.play("head_rotation")
			clicked_speng = true
			$player_speng_head/Timer.wait_time-=0.2
			if $player_speng_head/Timer.wait_time<=0:
				$player_speng_head/Timer.wait_time = 0.5
			Global.save_dict["speng_scores"]+=1
			Global.save_game()
			$player_speng_head/SpeangBody/CPUParticles.emitting = true
			$player_speng_head.transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-21)
			$player_speng_head/Label3D.text = str(Global.save_dict["speng_scores"])
			$player_speng_head/AudioStreamPlayer.stream = sound_efx_speng[rand_range(0,sound_efx_speng.size())]
			$player_speng_head/AudioStreamPlayer.stream.loop = false
			$player_speng_head/AudioStreamPlayer.play()

func _on_AnimationPlayer_speng(_anim_name):
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

func _on_TextureButton_down_pressed():
	$Camera.transform.origin.z += 7
