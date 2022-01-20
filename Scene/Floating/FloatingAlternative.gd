extends Node2D

func _on_Area2DOlay_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch :
		Global.MenuAudioS()
		Global.SceneSoundPlay()
		get_tree().change_scene("res://Scene/Floating/FloatingOlay.tscn")

func _on_Area2DMno_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch :
		Global.MenuAudioS()
		Global.SceneSoundPlay()
		get_tree().change_scene("res://Scene/Floating/FloatingMno.tscn")

func _on_Area2DSpeng_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch :
		Global.MenuAudioS()
		Global.SceneSoundPlay()
		get_tree().change_scene("res://Scene/Floating/FloatingSpeng.tscn")

func _on_Area2DIchuen_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch :
		Global.MenuAudioS()
		Global.SceneSoundPlay()
		get_tree().change_scene("res://Scene/Floating/FloatingIchuen.tscn")

func _on_HomeBT_pressed():
	Global.HomeAudioPlay()
	get_tree().change_scene("res://Scene/MainMenu.tscn")
