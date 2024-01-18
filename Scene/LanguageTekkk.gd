extends Control



func _on_EnglishBt_pressed():
	Global.tekkk_language = "En"
	get_tree().change_scene("res://Scene/MainMenu.tscn")


func _on_ThailandBt_pressed():
	Global.tekkk_language = "Th"
	get_tree().change_scene("res://Scene/MainMenu.tscn")
