extends Control
onready var bgm = $VBoxContainer2/HBoxContainer3/bgm_volume_Hslider
onready var sfx = $VBoxContainer2/HBoxContainer3/sfx_volume_Hslider

func ready():
	print(bgm.value)
	
	
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

func _on_bgm_volume_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("BGM"),value)
	
