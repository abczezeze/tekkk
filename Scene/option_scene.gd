extends Control

func _ready():
	$SoundSetting/HBoxContainer3/bgm_volume_HSlider.value = Global.bgm_volume
	$SoundSetting/HBoxContainer4/sfx_volume_HSlider.value = Global.sfx_volume
	tekkk_language(Global.tekkk_language)
	
func _on_HomeBT_pressed():
	Global.HomeAudioPlay()
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")

func _on_CheckButton_toggled(button_pressed):
	OS.window_fullscreen = button_pressed

func _on_1080p_Button_pressed():
	OS.set_window_size(Vector2(1920,1080))
	OS.center_window()

func _on_720p_Button_pressed():
	OS.set_window_size(Vector2(1280,720))
	OS.center_window()

func _on_VGA_Button_pressed():
	OS.set_window_size(Vector2(640,480))
	OS.center_window()

func _on_SVGA_Button_pressed():
	OS.set_window_size(Vector2(800,600))
	OS.center_window()

func _on_XVGA_Button_pressed():
	OS.set_window_size(Vector2(1024,768))
	OS.center_window()

func _on_sfx_volume_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"),value)
	Global.get_child(7).play()
	Global.sfx_volume = $SoundSetting/HBoxContainer4/sfx_volume_HSlider.value

func _on_bgm_volume_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("BGM"),value)
	Global.bgm_volume = $SoundSetting/HBoxContainer3/bgm_volume_HSlider.value
	
func tekkk_language(language):
	if language == "En":
		$VideoSetting/video_Label.text = "Vedio"
		$VideoSetting/HBoxContainer/full_screen_Label.text = "Full Screen"
		$VideoSetting/HBoxContainer2/resolution_Label.text = "Resolutions"
		$SoundSetting/sound_Label.text = "Sound"
		$SoundSetting/HBoxContainer3/bgm_volume_Label.text = "BGM volume"
		$SoundSetting/HBoxContainer4/sfx_volume_Label.text = "SFX Voume"
	if language == "Th":
		$VideoSetting/video_Label.text = "วิดีโอ"
		$VideoSetting/HBoxContainer/full_screen_Label.text = "เต็มจอ"
		$VideoSetting/HBoxContainer2/resolution_Label.text = "ความละเอียด"
		$SoundSetting/sound_Label.text = "เสียง"
		$SoundSetting/HBoxContainer3/bgm_volume_Label.text = "ระดับเสียงเพลง"
		$SoundSetting/HBoxContainer4/sfx_volume_Label.text = "ระดับเสียงเอ็ฟเฟ็ค"

