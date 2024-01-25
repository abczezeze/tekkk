extends Control

func _ready():
	Global.MenuAudioP()
	if Global.tekkk_language=="En":
		_on_EnglishBt_pressed()
	if Global.tekkk_language=="Th":
		_on_ThailandBt_pressed()
		
func _on_ClickMno_pressed():
	Global.MenuAudioS()
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Click/ClickMno.tscn")
	
func _on_ClickSpeng_pressed():
	Global.MenuAudioS()
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Click/ClickSpeng.tscn")
	
func _on_ClickIchuen_pressed():
	Global.MenuAudioS()
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Click/ClickIchuen.tscn")
	
func _on_ClickOlay_pressed():
	Global.MenuAudioS()
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Click/ClickOlay.tscn")

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
	$VBoxContainer2/OtherLb.text="Other"
	$VBoxContainer2/DetailBt.text="particulars"

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
	$VBoxContainer2/OtherLb.text="อื่นๆ"
	$VBoxContainer2/DetailBt.text="รายละเอียด"

func _on_DragMno_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Drag/DragMno.tscn")

func _on_DragSpeng_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Drag/DragSpeng.tscn")

func _on_DragIchuen_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Drag/DragIchuen.tscn")

func _on_DragOlay_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Drag/DragOlay.tscn")


func _on_SwipeLb_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Swipe/SwipeMix.tscn")


func _on_DetailBt_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Detail.tscn")
