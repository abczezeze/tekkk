extends Control

func _ready():
	Global.MenuAudioP()
	Global.load_game()
	if Global.tekkk_language=="En":
		_on_EnglishBt_pressed()
	if Global.tekkk_language=="Th":
		_on_ThailandBt_pressed()
	$LogoNocap.visible=Global.tekkk_logo
	$LogoNocap/AnimationPlayer.play("scale_logo")

		
func _on_ClickMno_pressed():
	Global.MenuAudioS()
	Global.SceneSoundPlay()
	var __ = get_tree().change_scene("res://Scene/Click/ClickMno.tscn")
	
func _on_ClickSpeng_pressed():
	Global.MenuAudioS()
	Global.SceneSoundPlay()
	var __ = get_tree().change_scene("res://Scene/Click/ClickSpeng.tscn")
	
func _on_ClickIchuen_pressed():
	Global.MenuAudioS()
	Global.SceneSoundPlay()
	var __ = get_tree().change_scene("res://Scene/Click/ClickIchuen.tscn")
	
func _on_ClickOlay_pressed():
	Global.MenuAudioS()
	Global.SceneSoundPlay()
	var __ = get_tree().change_scene("res://Scene/Click/ClickOlay.tscn")

func _on_EnglishBt_pressed():
	$VBoxContainer2/VBoxContainer/EnglishBt.disabled=true
	$VBoxContainer2/VBoxContainer/ThailandBt.disabled=false
	Global.tekkk_language = "En"
	$TekLb.text="Tekkk"
	$VBoxContainer2/SelectLevel.text="Select Level"
	$VBoxContainer2/HBoxContainer/ClickLb.text="Click"
	$VBoxContainer2/HBoxContainer/DragLb.text="Drag"
	$VBoxContainer2/HBoxContainer/SwipeLb.text="Swipe"
	$VBoxContainer2/VBoxContainer/Language.text="Language"
	$VBoxContainer2/VBoxContainer/EnglishBt.text="English"
	$VBoxContainer2/VBoxContainer/ThailandBt.text="Thailand"
	$VBoxContainer2/OtherLb.text="Other"
	$VBoxContainer2/DetailBt.text="particulars"
	$VBoxContainer2/Reset.text="RESET!"
	$VBoxContainer2/Reset.hint_tooltip="Reset the value"

func _on_ThailandBt_pressed():
	$VBoxContainer2/VBoxContainer/EnglishBt.disabled=false
	$VBoxContainer2/VBoxContainer/ThailandBt.disabled=true
	Global.tekkk_language = "Th"
	$TekLb.text="เต็กเคเค"
	$VBoxContainer2/SelectLevel.text="เลือกด่าน"
	$VBoxContainer2/HBoxContainer/ClickLb.text="คลิก"
	$VBoxContainer2/HBoxContainer/DragLb.text="ลาก"
	$VBoxContainer2/HBoxContainer/SwipeLb.text="ตวัด"
	$VBoxContainer2/VBoxContainer/Language.text="ภาษา"
	$VBoxContainer2/VBoxContainer/EnglishBt.text="อังกฤษ"
	$VBoxContainer2/VBoxContainer/ThailandBt.text="ไทย"
	$VBoxContainer2/OtherLb.text="อื่นๆ"
	$VBoxContainer2/DetailBt.text="รายละเอียด"
	$VBoxContainer2/Reset.text="เริ่มค่าใหม่!"
	$VBoxContainer2/Reset.hint_tooltip="Sorry"

func _on_SwipeLb_pressed():
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/Swipe/SwipeMix.tscn")

func _on_DetailBt_pressed():
	Global.SceneSoundPlay()
	var __ = get_tree().change_scene("res://Scene/Detail.tscn")

func _on_ClickLb_pressed():
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/Click/ClickMix.tscn")

func _on_DragLb_pressed():
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/Drag/DragMix.tscn")

func _on_AnimationPlayer_animation_finished(_anim_name):
	Global.tekkk_logo=false
	$LogoNocap.visible=false

func _on_ResetScore_pressed():
	Global.save_dict["mno_scores"]=0
	Global.save_dict["olay_scores"]=0
	Global.save_dict["ichuen_scores"]=0
	Global.save_dict["speng_scores"]=0
	Global.save_dict["mno_anim"]=false
	Global.save_dict["olay_anim"]=false
	Global.save_dict["ichuen_anim"]=false
	Global.save_dict["speng_anim"]=false
#	print(Global.save_dict)
	Global.save_game()
	Global.load_game()
