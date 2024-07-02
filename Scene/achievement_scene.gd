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
	$yo_hbox/TextureProgress.value = total_scores
	$yo_hbox/Label.text = str(broze_achieveement(total_scores))+"%"
	
	$total_bronze_hbox/TextureProgress.value = total_scores
	$total_bronze_hbox/Label.text = str(broze_achieveement(total_scores))+"%"
	
	$bass_bronze_hbox/TextureProgress.value = mno_scores
	$bass_bronze_hbox/Label.text = str(broze_achieveement(mno_scores))+"%"
	
	$guitar_bronze_hbox/TextureProgress.value = speng_scores
	$guitar_bronze_hbox/Label.text = str(broze_achieveement(speng_scores))+"%"
	
	$turntable_bronze_hbox/TextureProgress.value = ichuen_scores
	$turntable_bronze_hbox/Label.text = str(broze_achieveement(ichuen_scores))+"%"
	
	$drum_bronze_hbox/TextureProgress.value = olay_scores
	$drum_bronze_hbox/Label.text = str(broze_achieveement(olay_scores))+"%"
	
func broze_achieveement(scores:float) -> float:
	var result:float = scores/10*100
	if result >= 100:
		return 100.00
	else:
		return result
	
func _on_HomeBT_pressed():
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")
	Global.HomeAudioPlay()
