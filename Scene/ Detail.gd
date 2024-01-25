extends Control

func _ready():
	$VBoxContainer/MnoScores.text="Mno : "+str(Global.mno_scores)
	$VBoxContainer/SpengScores.text="Speng : "+str(Global.speng_scores)
	$VBoxContainer/IchunScores.text="Ichue : "+str(Global.ichuen_scores)
	$VBoxContainer/OlayScores.text="Olay : "+str(Global.olay_scores)
	Global.total_scores = Global.speng_scores+Global.ichuen_scores+Global.olay_scores+Global.mno_scores
	$VBoxContainer/TotalScores.text="Total : "+ str(Global.total_scores)
	
func _on_Button_pressed():
	Global.DragS()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/MainMenu.tscn")
