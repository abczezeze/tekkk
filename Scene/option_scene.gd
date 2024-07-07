extends Control

func _ready():
	$VBoxContainer2/HBoxContainer3/bgm_volume_HSlider.value = Global.bgm_volume
	$VBoxContainer2/HBoxContainer4/sfx_volume_HSlider.value = Global.sfx_volume
	tekkk_language(Global.tekkk_language)
	
func _on_HomeBT_pressed():
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")

#func _process(delta):
#	print($HBoxContainer/CheckButton.pressed)
	
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
	Global.sfx_volume = $VBoxContainer2/HBoxContainer4/sfx_volume_HSlider.value

func _on_bgm_volume_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("BGM"),value)
	Global.bgm_volume = $VBoxContainer2/HBoxContainer3/bgm_volume_HSlider.value
	
func tekkk_language(language):
	if language == "En":
		$VBoxContainer/video_Label.text = "Vedio Setting"
		$VBoxContainer/HBoxContainer/full_screen_Label.text = "Full Screen"
		$VBoxContainer/HBoxContainer2/resolution_Label.text = "Resolutions"
		$VBoxContainer2/sound_Label.text = "Sound Setting"
		$VBoxContainer2/HBoxContainer3/bgm_volume_Label.text = "BGM volume"
		$VBoxContainer2/HBoxContainer4/sfx_volume_Label.text = "SFX Voume"
	if language == "Th":
		$VBoxContainer/video_Label.text = "ตั้งค่าวิดีโอ"
		$VBoxContainer/HBoxContainer/full_screen_Label.text = "เต็มจอ"
		$VBoxContainer/HBoxContainer2/resolution_Label.text = "ความละเอียด"
		$VBoxContainer2/sound_Label.text = "ตั้งค่าเสียง"
		$VBoxContainer2/HBoxContainer3/bgm_volume_Label.text = "ระดับเสียงเพลง"
		$VBoxContainer2/HBoxContainer4/sfx_volume_Label.text = "ระดับเสียงเอ็ฟเฟ็ค"

