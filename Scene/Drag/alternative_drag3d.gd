extends Node2D

func _ready():
	pass
	
func _on_home_Button_pressed():
	Global.MenuAudioS()
	Global.HomeAudioPlay()
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")
	
func _on_mno_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("ui_click"):
		print(event)

func _on_ichuen_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("ui_click"):
		var __ = get_tree().change_scene("res://Scene/drag3d/drag3d_ichuen.tscn")


func _on_olay_Area2D_input_event(viewport, event, shape_idx):
	pass # Replace with function body.


func _on_speng_Area2D_input_event(viewport, event, shape_idx):
	pass # Replace with function body.
