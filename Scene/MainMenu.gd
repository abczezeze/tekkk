extends Control

func _ready():
	Global.MenuAudioP()
	$VBoxContainer2/VBoxContainer/EnglishBt.disabled=true

func _on_ClickLb_pressed():
	Global.MenuAudioS()
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Floating/FloatingMix.tscn")
	
func _on_FloatingMno_pressed():
	Global.MenuAudioS()
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Floating/FloatingMno.tscn")
	
func _on_FloatingSpeng_pressed():
	Global.MenuAudioS()
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Floating/FloatingSpeng.tscn")
	
func _on_FloatingIchuen_pressed():
	Global.MenuAudioS()
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Floating/FloatingIchuen.tscn")
	
func _on_FloatingOlay_pressed():
	Global.MenuAudioS()
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Floating/FloatingOlay.tscn")
	
func _on_lv3_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Drag/DragAlternative.tscn")

func _on_lv4_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Swipe/SwipeMix.tscn")

func _on_EnglishBt_pressed():
	$VBoxContainer2/VBoxContainer/EnglishBt.disabled=true
	$VBoxContainer2/VBoxContainer/ThailandBt.disabled=false
	Global.tekkk_language = "En"
	$TekLb.text="Tekkk"
	$VBoxContainer2/SelectLevel.text="Select Level"
	$VBoxContainer2/HBoxContainer/ClickLb.text="Click"
	$VBoxContainer2/HBoxContainer3/DragLb.text="Drag"
	$VBoxContainer2/HBoxContainer2/SwipeLb.text="Swipe"
	$VBoxContainer2/VBoxContainer/Language.text="Language"
	$VBoxContainer2/VBoxContainer/EnglishBt.text="English"
	$VBoxContainer2/VBoxContainer/ThailandBt.text="Thailand"

func _on_ThailandBt_pressed():
	$VBoxContainer2/VBoxContainer/EnglishBt.disabled=false
	$VBoxContainer2/VBoxContainer/ThailandBt.disabled=true
	Global.tekkk_language = "Th"
	$TekLb.text="เต็กเคเค"
	$VBoxContainer2/SelectLevel.text="เลือกด่าน"
	$VBoxContainer2/HBoxContainer/ClickLb.text="คลิก"
	$VBoxContainer2/HBoxContainer3/DragLb.text="ลาก"
	$VBoxContainer2/HBoxContainer2/SwipeLb.text="ตวัด"
	$VBoxContainer2/VBoxContainer/Language.text="ภาษา"
	$VBoxContainer2/VBoxContainer/EnglishBt.text="อังกฤษ"
	$VBoxContainer2/VBoxContainer/ThailandBt.text="ไทย"
