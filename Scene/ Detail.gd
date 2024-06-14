extends Control

var total_scores

func _ready():
	total_scores = Global.save_dict["mno_scores"]+Global.save_dict["olay_scores"]+Global.save_dict["ichuen_scores"]+Global.save_dict["speng_scores"]
	$TextureProgress.value = total_scores
	tekkk_language(Global.tekkk_language)
	Global.save_dict["mno_scores"] = 3333
	Global.save_dict["olay_scores"] = 444
	Global.save_dict["ichuen_scores"] = 55
	Global.save_dict["speng_scores"] = 6
	
func _process(delta):
	$score_vbox/ClickMno.text=str(Global.save_dict["mno_scores"])
	$score_vbox/ClickOlay.text=str(Global.save_dict["olay_scores"])
	$score_vbox/ClickIchuen.text=str(Global.save_dict["ichuen_scores"])
	$score_vbox/ClickSpeng.text=str(Global.save_dict["speng_scores"])
	
func _on_Button_pressed():
	Global.DragS()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")

func tekkk_language(language):
	if language == "En":
		
		$TotalScores.text = "Total : "+ str(total_scores)
	if language == "Th":
		$TotalScores.text = "คะแนนรวม : "+ str(total_scores)
