extends Control

var mno_scores:float = Global.save_dict["mno_scores"]
var speng_scores:float = Global.save_dict["speng_scores"]
var ichuen_scores:float = Global.save_dict["ichuen_scores"]
var olay_scores:float = Global.save_dict["olay_scores"]
var total_scores:float = Global.total_scores

func _ready():
	$score_vbox/ClickMno.text=str(mno_scores)
	$score_vbox/ClickOlay.text=str(olay_scores)
	$score_vbox/ClickIchuen.text=str(ichuen_scores)
	$score_vbox/ClickSpeng.text=str(speng_scores)
	$score_vbox/TotalScores.text=str(total_scores)
	tekkk_language(Global.tekkk_language)
	

func _process(_delta):
#	bronze trophies
	$ScrollContainer/VBoxContainer/yo_hbox/TextureProgress.value = total_scores
	$ScrollContainer/VBoxContainer/yo_hbox/Label.text = str(broze_achieveement(total_scores))+"%"
	$ScrollContainer/VBoxContainer/total_bronze_hbox/TextureProgress.value = total_scores
	$ScrollContainer/VBoxContainer/total_bronze_hbox/Label.text = str(broze_achieveement(total_scores))+"%"
	$ScrollContainer/VBoxContainer/bass_bronze_hbox/TextureProgress.value = mno_scores
	$ScrollContainer/VBoxContainer/bass_bronze_hbox/Label.text = str(broze_achieveement(mno_scores))+"%"
	$ScrollContainer/VBoxContainer/guitar_bronze_hbox/TextureProgress.value = speng_scores
	$ScrollContainer/VBoxContainer/guitar_bronze_hbox/Label.text = str(broze_achieveement(speng_scores))+"%"
	$ScrollContainer/VBoxContainer/turntable_bronze_hbox/TextureProgress.value = ichuen_scores
	$ScrollContainer/VBoxContainer/turntable_bronze_hbox/Label.text = str(broze_achieveement(ichuen_scores))+"%"
	$ScrollContainer/VBoxContainer/drum_bronze_hbox/TextureProgress.value = olay_scores
	$ScrollContainer/VBoxContainer/drum_bronze_hbox/Label.text = str(broze_achieveement(olay_scores))+"%"
#	silver trophies
	$ScrollContainer/VBoxContainer/total_silver_hbox/TextureProgress.value = total_scores
	$ScrollContainer/VBoxContainer/total_silver_hbox/Label.text = str(silver_achieveement(total_scores))+"%"
	$ScrollContainer/VBoxContainer/mno_silver_hbox/TextureProgress.value = mno_scores
	$ScrollContainer/VBoxContainer/mno_silver_hbox/Label.text = str(silver_achieveement(mno_scores))+"%"
	$ScrollContainer/VBoxContainer/speng_silver_hbox/TextureProgress.value = speng_scores
	$ScrollContainer/VBoxContainer/speng_silver_hbox/Label.text = str(silver_achieveement(speng_scores))+"%"
	$ScrollContainer/VBoxContainer/ichuen_silver_hbox/TextureProgress.value = ichuen_scores
	$ScrollContainer/VBoxContainer/ichuen_silver_hbox/Label.text = str(silver_achieveement(ichuen_scores))+"%"
	$ScrollContainer/VBoxContainer/olay_silver_hbox/TextureProgress.value = olay_scores
	$ScrollContainer/VBoxContainer/olay_silver_hbox/Label.text = str(silver_achieveement(olay_scores))+"%"
#	gold trophies
	$ScrollContainer/VBoxContainer/total_gold_hbox/TextureProgress.value = total_scores
	$ScrollContainer/VBoxContainer/total_gold_hbox/Label.text = str(gold_achieveement(total_scores))+"%"
	$ScrollContainer/VBoxContainer/mno_bass_gold_hbox/TextureProgress.value = mno_scores
	$ScrollContainer/VBoxContainer/mno_bass_gold_hbox/Label.text = str(gold_achieveement(mno_scores))+"%"
	$ScrollContainer/VBoxContainer/speng_guitar_gold_hbox/TextureProgress.value = speng_scores
	$ScrollContainer/VBoxContainer/speng_guitar_gold_hbox/Label.text = str(gold_achieveement(speng_scores))+"%"
	$ScrollContainer/VBoxContainer/ichuen_turntable_gold_hbox/TextureProgress.value = ichuen_scores
	$ScrollContainer/VBoxContainer/ichuen_turntable_gold_hbox/Label.text = str(gold_achieveement(ichuen_scores))+"%"
	$ScrollContainer/VBoxContainer/olay_drum_gold_hbox/TextureProgress.value = olay_scores
	$ScrollContainer/VBoxContainer/olay_drum_gold_hbox/Label.text = str(gold_achieveement(olay_scores))+"%"
	
func broze_achieveement(scores:float) -> float:
	var result:float = scores/10*100
	if result >= 100:
		return 100.00
	else:
		return result
		
func silver_achieveement(scores:float) -> float:
	var result:float = scores/100*100
	if result >= 100:
		return 100.00
	else:
		return result
		
func gold_achieveement(scores:float) -> float:
	var result:float = scores/200*100
	if result >= 100:
		return 100.00
	else:
		return result
	
func _on_HomeBT_pressed():
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")
	Global.HomeAudioPlay()

func tekkk_language(language):
	if language == "En":
#		bronze
		$ScrollContainer/VBoxContainer/yo_hbox/RichTextLabel.bbcode_text = \
		"[color=blue]Yo! Tekkk[/color] [img]res://Image/player_bt4Head.png[/img] 5 scores"
		$ScrollContainer/VBoxContainer/total_bronze_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_bt4Head.png[/img][color=blue]Bronze[/color]  10 scores"
		$ScrollContainer/VBoxContainer/bass_bronze_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_mno.png[/img][color=blue]Bronze[/color] 10 scores"
		$ScrollContainer/VBoxContainer/guitar_bronze_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_Speng.png[/img][color=blue]Bronze[/color] 10 scores"
		$ScrollContainer/VBoxContainer/turntable_bronze_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_Ichuen.png[/img][color=blue]Bronze[/color] 10 scores"
		$ScrollContainer/VBoxContainer/drum_bronze_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_olayzzz.png[/img][color=blue]Bronze[/color] 10 scores"
#		silver
		$ScrollContainer/VBoxContainer/total_silver_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_bt4Head.png[/img][color=blue]silver[/color]  100 scores"
		$ScrollContainer/VBoxContainer/mno_silver_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_mno.png[/img][color=blue]silver[/color] 100 scores"
		$ScrollContainer/VBoxContainer/speng_silver_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_Speng.png[/img][color=blue]silver[/color] 100 scores"
		$ScrollContainer/VBoxContainer/ichuen_silver_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_Ichuen.png[/img][color=blue]silver[/color] 100 scores"
		$ScrollContainer/VBoxContainer/olay_silver_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_olayzzz.png[/img][color=blue]silver[/color] 100 scores"
#		gold
		$ScrollContainer/VBoxContainer/total_gold_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_bt4Head.png[/img][color=blue]gold[/color]  200 scores"
		$ScrollContainer/VBoxContainer/mno_bass_gold_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_mno.png[/img][color=blue]gold[/color] 200 scores"
		$ScrollContainer/VBoxContainer/speng_guitar_gold_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_Speng.png[/img][color=blue]gold[/color] 200 scores"
		$ScrollContainer/VBoxContainer/ichuen_turntable_gold_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_Ichuen.png[/img][color=blue]gold[/color] 200 scores"
		$ScrollContainer/VBoxContainer/olay_drum_gold_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_olayzzz.png[/img][color=blue]gold[/color] 200 scores"
	if language == "Th":
#		bronze
		$ScrollContainer/VBoxContainer/yo_hbox/RichTextLabel.bbcode_text = \
		"[color=blue]โย่ว! เต็กเคเค[/color][img]res://Image/player_bt4Head.png[/img] 5 คะแนน"
		$ScrollContainer/VBoxContainer/total_bronze_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_bt4Head.png[/img][color=blue]ถ้วยทองแดง[/color]  10 คะแนน"
		$ScrollContainer/VBoxContainer/bass_bronze_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_mno.png[/img][color=blue]ถ้วยทองแดง[/color] 10 คะแนน"
		$ScrollContainer/VBoxContainer/guitar_bronze_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_Speng.png[/img][color=blue]ถ้วยทองแดง[/color] 10 คะแนน"
		$ScrollContainer/VBoxContainer/turntable_bronze_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_Ichuen.png[/img][color=blue]ถ้วยทองแดง[/color] 10 คะแนน"
		$ScrollContainer/VBoxContainer/drum_bronze_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_olayzzz.png[/img][color=blue]ถ้วยทองแดง[/color] 10 คะแนน"
#		silver
		$ScrollContainer/VBoxContainer/total_silver_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_bt4Head.png[/img][color=blue]ถ้วยเงิน[/color]  100 คะแนน"
		$ScrollContainer/VBoxContainer/mno_silver_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_mno.png[/img][color=blue]ถ้วยเงิน[/color] 100 คะแนน"
		$ScrollContainer/VBoxContainer/speng_silver_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_Speng.png[/img][color=blue]ถ้วยเงิน[/color] 100 คะแนน"
		$ScrollContainer/VBoxContainer/ichuen_silver_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_Ichuen.png[/img][color=blue]ถ้วยเงิน[/color] 100 คะแนน"
		$ScrollContainer/VBoxContainer/olay_silver_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_olayzzz.png[/img][color=blue]ถ้วยเงิน[/color] 100 คะแนน"
#		gold
		$ScrollContainer/VBoxContainer/total_gold_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_bt4Head.png[/img][color=blue]gold[/color]  200 คะแนน"
		$ScrollContainer/VBoxContainer/mno_bass_gold_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_mno.png[/img][color=blue]ถ้วยทอง[/color] 200 คะแนน"
		$ScrollContainer/VBoxContainer/speng_guitar_gold_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_Speng.png[/img][color=blue]ถ้วยทอง[/color] 200 คะแนน"
		$ScrollContainer/VBoxContainer/ichuen_turntable_gold_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_Ichuen.png[/img][color=blue]ถ้วยทอง[/color] 200 คะแนน"
		$ScrollContainer/VBoxContainer/olay_drum_gold_hbox/RichTextLabel.bbcode_text = \
		"[img]res://Image/player_Head_olayzzz.png[/img][color=blue]ถ้วยทอง[/color] 200 คะแนน"
