extends Control

var total_scores

func _ready():
	total_scores = Global.save_dict["mno_scores"]+Global.save_dict["olay_scores"]+Global.save_dict["ichuen_scores"]+Global.save_dict["speng_scores"]
	$TextureProgress_musical_consert.value = total_scores
	$TextureProgress_mno.value = Global.save_dict["mno_scores"]
	$TextureProgress_olay.value = Global.save_dict["olay_scores"]
	$TextureProgress_speng.value = Global.save_dict["speng_scores"]
	$TextureProgress_ichuen.value = Global.save_dict["ichuen_scores"]
	tekkk_language(Global.tekkk_language)
	
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
