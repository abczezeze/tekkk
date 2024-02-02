extends Control

var total_scores

func _ready():
	
	total_scores = Global.save_dict["mno_scores"]+Global.save_dict["olay_scores"]+Global.save_dict["ichuen_scores"]+Global.save_dict["speng_scores"]
	$TextureProgress.value = total_scores
	tekkk_language(Global.tekkk_language)
	
func _on_Button_pressed():
	Global.DragS()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/MainMenu.tscn")

func tekkk_language(language):
	if language == "En":
		$VBoxContainer/ClickMno.text="Mno : "+str(Global.save_dict["mno_scores"])
		$VBoxContainer/ClickOlay.text="Olay : "+str(Global.save_dict["olay_scores"])
		$VBoxContainer/ClickIchuen.text="Ichuen : "+str(Global.save_dict["ichuen_scores"])
		$VBoxContainer/ClickSpeng.text="Speng : "+str(Global.save_dict["speng_scores"])
		$TotalScores.text = "Total : "+ str(total_scores)
	if language == "Th":
		$VBoxContainer/ClickMno.text="คุณมโน : "+str(Global.save_dict["mno_scores"])
		$VBoxContainer/ClickOlay.text="คุณโอเล : "+str(Global.save_dict["olay_scores"])
		$VBoxContainer/ClickIchuen.text="คุณไอชื่น : "+str(Global.save_dict["ichuen_scores"])
		$VBoxContainer/ClickSpeng.text="คุณสเปง : "+str(Global.save_dict["speng_scores"])
		$TotalScores.text = "คะแนนรวม : "+ str(total_scores)
