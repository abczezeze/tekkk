extends Control

func _ready() -> void:
	Global.MenuAudioP()
	Global.load_game()
	$LogoNocap.visible = true
	$AnimationPlayer.play("scale_logo")
	if Global.tekkk_language=="En":
		_on_EnglishBt_pressed()
	if Global.tekkk_language=="Th":
		_on_ThailandBt_pressed()

func _on_EnglishBt_pressed() -> void:
	$VBoxContainer2/VBoxContainer/EnglishBt.disabled=true
	$VBoxContainer2/VBoxContainer/ThailandBt.disabled=false
	Global.tekkk_language = "En"
	$TekLb.text="Tekkk"
	$VBoxContainer2/SelectLevel.text="Select Level"
	$VBoxContainer2/HBoxContainer/ClickLb.text="Click"
	$VBoxContainer2/HBoxContainer/DragLb.text="Drag"
	$VBoxContainer2/HBoxContainer/SwipeLb.text="Swipe"
	$VBoxContainer2/level_3d/click_3d.text="click"
	$VBoxContainer2/level_3d/drag_3d.text="drag"
	$VBoxContainer2/level_3d/shoot_3d.text="shoot"
	$VBoxContainer2/VBoxContainer/Language.text="Language"
	$VBoxContainer2/VBoxContainer/EnglishBt.text="English"
	$VBoxContainer2/VBoxContainer/ThailandBt.text="Thailand"
	$VBoxContainer2/OtherLb.text="Other"
	$VBoxContainer2/DetailBt.text="Detail"
	$VBoxContainer2/reset_button.text="RESET!"

func _on_ThailandBt_pressed() -> void:
	$VBoxContainer2/VBoxContainer/EnglishBt.disabled=false
	$VBoxContainer2/VBoxContainer/ThailandBt.disabled=true
	Global.tekkk_language = "Th"
	$TekLb.text="เต็กเคเค"
	$VBoxContainer2/SelectLevel.text="เลือกด่าน"
	$VBoxContainer2/HBoxContainer/ClickLb.text="คลิก"
	$VBoxContainer2/HBoxContainer/DragLb.text="ลาก"
	$VBoxContainer2/HBoxContainer/SwipeLb.text="ตวัด"
	$VBoxContainer2/level_3d/click_3d.text="คลิก"
	$VBoxContainer2/level_3d/drag_3d.text="ลาก"
	$VBoxContainer2/level_3d/shoot_3d.text=" ยิง "
	$VBoxContainer2/VBoxContainer/Language.text="ภาษา"
	$VBoxContainer2/VBoxContainer/EnglishBt.text="อังกฤษ"
	$VBoxContainer2/VBoxContainer/ThailandBt.text="ไทย"
	$VBoxContainer2/OtherLb.text="อื่นๆ"
	$VBoxContainer2/DetailBt.text="รายละเอียด"
	$VBoxContainer2/reset_button.text="เริ่มค่าใหม่!"

func _on_SwipeLb_pressed() -> void:
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/Swipe/SwipeMix.tscn")

func _on_DetailBt_pressed() -> void:
	Global.SceneSoundPlay()
	var __ = get_tree().change_scene("res://Scene/Detail.tscn")

func _on_ClickLb_pressed() -> void:
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/Click/ClickMix.tscn")

func _on_DragLb_pressed() -> void:
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/Drag/DragMix.tscn")

func _on_AnimationPlayer_animation_finished(_anim_name) -> void:
	Global.tekkk_logo=false
	$LogoNocap.visible=false

func _on_click_3d_pressed() -> void:
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/click3d/click_mix_3d.tscn")

func _on_drag_3d_pressed() -> void:
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/drag3d/drag3d_mix.tscn")

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
