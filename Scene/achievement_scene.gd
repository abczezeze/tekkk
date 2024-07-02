extends Control

var mno_scores:float = Global.save_dict["mno_scores"]
var speng_scores:float = Global.save_dict["speng_scores"]
var ichuen_scores:float = Global.save_dict["ichuen_scores"]
var olay_scores:float = Global.save_dict["olay_scores"]
var total_scores:float = mno_scores+speng_scores+ichuen_scores+olay_scores

func _ready():
	$score_vbox/ClickMno.text=str(mno_scores)
	$score_vbox/ClickOlay.text=str(olay_scores)
	$score_vbox/ClickIchuen.text=str(ichuen_scores)
	$score_vbox/ClickSpeng.text=str(speng_scores)
	$score_vbox/TotalScores.text=str(total_scores)
	print(broze_achieveement(mno_scores))

func _process(_delta):
	$VBoxContainer/yo_hbox/TextureProgress.value = total_scores
	$VBoxContainer/yo_hbox/Label.text = str(broze_achieveement(total_scores))+"%"
	
	$VBoxContainer/total_bronze_hbox/TextureProgress.value = total_scores
	$VBoxContainer/total_bronze_hbox/Label.text = str(broze_achieveement(total_scores))+"%"
	
	$VBoxContainer/bass_bronze_hbox/TextureProgress.value = mno_scores
	$VBoxContainer/bass_bronze_hbox/Label.text = str(broze_achieveement(mno_scores))+"%"
	
	$VBoxContainer/guitar_bronze_hbox/TextureProgress.value = speng_scores
	$VBoxContainer/guitar_bronze_hbox/Label.text = str(broze_achieveement(speng_scores))+"%"
	
	$VBoxContainer/turntable_bronze_hbox/TextureProgress.value = ichuen_scores
	$VBoxContainer/turntable_bronze_hbox/Label.text = str(broze_achieveement(ichuen_scores))+"%"
	
	$VBoxContainer/drum_bronze_hbox/TextureProgress.value = olay_scores
	$VBoxContainer/drum_bronze_hbox/Label.text = str(broze_achieveement(olay_scores))+"%"
	
func broze_achieveement(scores:float) -> float:
	var result:float = scores/10*100
	if result >= 100:
		return 100.00
	else:
		return result
	
func _on_HomeBT_pressed():
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")
	Global.HomeAudioPlay()
