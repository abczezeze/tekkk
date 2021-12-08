extends Control

func _ready():
#	PlayIntegration.sign_in()
	pass

func _on_AchievementBT_pressed():
	PlayIntegration.showAchievement()

func _on_lv1_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Floating/FloatingMain.tscn")

func _on_lv2_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Floating/FloatingMno.tscn")

func _on_lv3_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Floating/FloatingOlay.tscn")

func _on_lv4_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Floating/FloatingSpeng.tscn")

func _on_lv5_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Floating/FloatingIchuen.tscn")

func _on_lv6_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Drag/DragMno.tscn")

func _on_lv7_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Drag/DragOlay.tscn")

func _on_lv8_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Drag/DragSpeng.tscn")

func _on_lv9_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Drag/DragIchuen.tscn")
