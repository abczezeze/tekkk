extends Control

func _ready():
#	PlayIntegration.sign_in()
	Global.MenuAudioP()

func _on_AchievementBT_pressed():
	if PlayIntegration.sign_in():
		PlayIntegration.showAchievement()

func _on_lv1_pressed():
	Global.MenuAudioS()
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Floating/FloatingMain.tscn")

func _on_lv2_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Floating/FloatingAlternative.tscn")

func _on_lv3_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Drag/DragAlternative.tscn")

func _on_lv4_pressed():
	Global.SceneSoundPlay()
	get_tree().change_scene("res://Scene/Swipe/SwipeMix.tscn")

