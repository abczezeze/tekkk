extends Node2D

func _on_Area2DMno_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		Global.MenuAudioS()
		Global.SceneSoundPlay()
		get_tree().change_scene("res://Scene/Drag/DragMno.tscn")


func _on_Area2DIchuen_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		Global.MenuAudioS()
		Global.SceneSoundPlay()
		get_tree().change_scene("res://Scene/Drag/DragIchuen.tscn")


func _on_Area2DOlay_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		Global.MenuAudioS()
		Global.SceneSoundPlay()
		get_tree().change_scene("res://Scene/Drag/DragOlay.tscn")


func _on_Area2DSpeng_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		Global.MenuAudioS()
		Global.SceneSoundPlay()
		get_tree().change_scene("res://Scene/Drag/DragSpeng.tscn")


func _on_HomeBT_pressed():
	Global.DragS()
	Global.HomeAudioPlay()
	get_tree().change_scene("res://Scene/MainMenu.tscn")
