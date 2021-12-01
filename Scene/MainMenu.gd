extends Control

func _ready():
#	PlayIntegration.sign_in()
	pass

func _on_Button_pressed():
	get_tree().change_scene("res://Scene/Main.tscn")

func _on_AchievementBT_pressed():
	PlayIntegration.showAchievement()
