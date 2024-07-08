extends Control

func _ready() -> void:
	Global.MenuAudioP()
	Global.load_game()
	$LogoNocap.visible = true
	$AnimationPlayer.play("scale_logo")
	if Global.tekkk_language=="En":
		_on_TextureButton_toggled(false)
	if Global.tekkk_language=="Th":
		_on_TextureButton_toggled(true)
	if OS.has_feature("web"):
		$VBoxContainer2/level_3d/click_3d.disabled = true
		$VBoxContainer2/level_3d/drag_3d.disabled = true
		$VBoxContainer2/level_3d/shoot_3d.disabled = true
		$LinkButton.visible = true

func _on_SwipeLb_pressed() -> void:
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/Swipe/SwipeMix.tscn")

func _on_ClickLb_pressed() -> void:
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/Click/ClickMix.tscn")

func _on_DragLb_pressed() -> void:
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/Drag/DragMix.tscn")

func _on_click_3d_pressed() -> void:
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/click3d/click_mix_3d.tscn")

func _on_drag_3d_pressed() -> void:
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/drag3d/drag3d_mix.tscn")
	
func _on_shoot_3d_pressed():
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ =  get_tree().change_scene("res://Scene/shoot3d/shoot3d_mix.tscn")

func _on_achievement_button_pressed():
	Global.SceneSoundPlay()
	var __ =  get_tree().change_scene("res://Scene/achievement_scene.tscn")
	
func _on_option_button_pressed():
	Global.SceneSoundPlay()
	var __ =  get_tree().change_scene("res://Scene/option_scene.tscn")

func _on_reset_button_pressed() -> void:
	Global.save_dict["mno_scores"]=0
	Global.save_dict["olay_scores"]=0
	Global.save_dict["ichuen_scores"]=0
	Global.save_dict["speng_scores"]=0
	Global.save_dict["mno_anim"]=false
	Global.save_dict["olay_anim"]=false
	Global.save_dict["ichuen_anim"]=false
	Global.save_dict["speng_anim"]=false
	Global.save_game()
	Global.load_game()

func _on_TextureButton_toggled(button_pressed) -> void:
	if button_pressed:
		$TextureButton_language.modulate = Color(1,1,1,2)
		Global.tekkk_language = "Th"
		$TekLb.text="เต็กเคเค"
		$VBoxContainer2/SelectLevel.text="เลือกด่าน"
		$VBoxContainer2/HBoxContainer/ClickLb.text="คลิก"
		$VBoxContainer2/HBoxContainer/DragLb.text="ลาก"
		$VBoxContainer2/HBoxContainer/SwipeLb.text="ตวัด"
		$VBoxContainer2/level_3d/click_3d.text="คลิก"
		$VBoxContainer2/level_3d/drag_3d.text="ลาก"
		$VBoxContainer2/level_3d/shoot_3d.text=" ยิง "
		$VBoxContainer2/OtherLb.text="อื่นๆ"
		$VBoxContainer2/achievement_button.text="ความสำเร็จ"
		$VBoxContainer2/option_button.text="ตั้งค่า"
		$VBoxContainer2/reset_button.text="เริ่มค่าใหม่!"
	else:
		$TextureButton_language.modulate = Color(1,1,1,1)
		Global.tekkk_language = "En"
		$TekLb.text="Tekkk"
		$VBoxContainer2/SelectLevel.text="Select Level"
		$VBoxContainer2/HBoxContainer/ClickLb.text="Click"
		$VBoxContainer2/HBoxContainer/DragLb.text="Drag"
		$VBoxContainer2/HBoxContainer/SwipeLb.text="Swipe"
		$VBoxContainer2/level_3d/click_3d.text="click"
		$VBoxContainer2/level_3d/drag_3d.text="drag"
		$VBoxContainer2/level_3d/shoot_3d.text="shoot"
		$VBoxContainer2/OtherLb.text="Other"
		$VBoxContainer2/achievement_button.text="Achievement"
		$VBoxContainer2/option_button.text="Option"
		$VBoxContainer2/reset_button.text="RESET!"

func _on_LinkButton_pressed():
	OS.shell_open("https://abczezeze.itch.io/tekkk/purchase")
