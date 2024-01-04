extends Control

func _ready():
	Global.MenuAudioP()
	if Global.total_scores > 0:
		$CenterContainer/VBoxContainer/TotalLabel.text = str("Total : ",Global.total_scores)
		$CenterContainer/VBoxContainer/TotalLabel.show()
	else:
		$CenterContainer/VBoxContainer/TotalLabel.hide()

func _on_lv1_pressed():
	Global.MenuAudioS()
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Floating/FloatingMix.tscn")

func _on_lv2_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Floating/FloatingAlternative.tscn")

func _on_lv3_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Drag/DragAlternative.tscn")

func _on_lv4_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Swipe/SwipeMix.tscn")

