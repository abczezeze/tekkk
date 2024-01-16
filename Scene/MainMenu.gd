extends Control

func _ready():
	Global.MenuAudioP()

func _on_FloatingMix_pressed():
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


