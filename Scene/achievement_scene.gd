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
	tekkk_language(Global.tekkk_language)

func _process(_delta):
#	bronze trophies
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
#	silver trophies
	$VBoxContainer/total_silver_hbox/TextureProgress.value = total_scores
	$VBoxContainer/total_silver_hbox/Label.text = str(silver_achieveement(total_scores))+"%"
	$VBoxContainer/mno_silver_hbox/TextureProgress.value = mno_scores
	$VBoxContainer/mno_silver_hbox/Label.text = str(silver_achieveement(mno_scores))+"%"
	$VBoxContainer/speng_silver_hbox/TextureProgress.value = speng_scores
	$VBoxContainer/speng_silver_hbox/Label.text = str(silver_achieveement(speng_scores))+"%"
	$VBoxContainer/ichuen_silver_hbox/TextureProgress.value = ichuen_scores
	$VBoxContainer/ichuen_silver_hbox/Label.text = str(silver_achieveement(ichuen_scores))+"%"
	$VBoxContainer/olay_silver_hbox/TextureProgress.value = olay_scores
	$VBoxContainer/olay_silver_hbox/Label.text = str(silver_achieveement(olay_scores))+"%"
#	gold trophies
	$VBoxContainer/total_gold_hbox/TextureProgress.value = total_scores
	$VBoxContainer/total_gold_hbox/Label.text = str(gold_achieveement(total_scores))+"%"
	$VBoxContainer/mno_bass_gold_hbox/TextureProgress.value = mno_scores
	$VBoxContainer/mno_bass_gold_hbox/Label.text = str(gold_achieveement(mno_scores))+"%"
	$VBoxContainer/speng_guitar_gold_hbox/TextureProgress.value = speng_scores
	$VBoxContainer/speng_guitar_gold_hbox/Label.text = str(gold_achieveement(speng_scores))+"%"
	$VBoxContainer/ichuen_turntable_gold_hbox/TextureProgress.value = ichuen_scores
	$VBoxContainer/ichuen_turntable_gold_hbox/Label.text = str(gold_achieveement(ichuen_scores))+"%"
	$VBoxContainer/olay_drum_gold_hbox/TextureProgress.value = olay_scores
	$VBoxContainer/olay_drum_gold_hbox/Label.text = str(gold_achieveement(olay_scores))+"%"
	
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
		$VBoxContainer/yo_hbox/RichTextLabel.bbcode_text = "Yo! JaTuRas\n5 total scores"
		$VBoxContainer/total_bronze_hbox/RichTextLabel.bbcode_text = "Total Bronze\n10 total scores"
		$VBoxContainer/bass_bronze_hbox/RichTextLabel.bbcode_text = "Bass Bronze\n10 mno scores"
		$VBoxContainer/guitar_bronze_hbox/RichTextLabel.bbcode_text = "Guitar Bronze\n10 speng scores"
		$VBoxContainer/turntable_bronze_hbox/RichTextLabel.bbcode_text = "Turtable Bronze\n10 ichuen scores"
		$VBoxContainer/drum_bronze_hbox/RichTextLabel.bbcode_text = "Drum Bronze\n10 olay scores"
#		silver
		$VBoxContainer/total_silver_hbox/RichTextLabel.bbcode_text = "Total Silver\n100 total scores"
		$VBoxContainer/mno_silver_hbox/RichTextLabel.bbcode_text = "Mno Silver\n100 mno scores"
		$VBoxContainer/speng_silver_hbox/RichTextLabel.bbcode_text = "Speng Silver\n100 speng scores"
		$VBoxContainer/ichuen_silver_hbox/RichTextLabel.bbcode_text = "Ichuen Silver\n100 ichuen scores"
		$VBoxContainer/olay_silver_hbox/RichTextLabel.bbcode_text = "Olay Silver\n100 olay scores"
#		gold
		$VBoxContainer/total_gold_hbox/RichTextLabel.bbcode_text = "Total Gold\n200 total scores"
		$VBoxContainer/mno_bass_gold_hbox/RichTextLabel.bbcode_text = "Mno Gold\n200 mno scores"
		$VBoxContainer/speng_guitar_gold_hbox/RichTextLabel.bbcode_text = "Speng Gold\n200 speng scores"
		$VBoxContainer/ichuen_turntable_gold_hbox/RichTextLabel.bbcode_text = "Ichuen Gold\n200 ichuen scores"
		$VBoxContainer/olay_drum_gold_hbox/RichTextLabel.bbcode_text = "Olay Gold\n200 olay scores"
	if language == "Th":
#		bronze
		$VBoxContainer/yo_hbox/RichTextLabel.bbcode_text = "โย่ว! จตุรัส\n5คะแนน คะแนนรวม"
		$VBoxContainer/total_bronze_hbox/RichTextLabel.bbcode_text = "คะแนนรวมถ้วยทองแดง\n10คะแนน-คะแนนรวม"
		$VBoxContainer/bass_bronze_hbox/RichTextLabel.bbcode_text = "เบสถ้วยทองแดง\n10คะแนน-คุณมะโน"
		$VBoxContainer/guitar_bronze_hbox/RichTextLabel.bbcode_text = "กีต้าร์ถ้วยทองแดง\n10คะนน-คุณสะเปง"
		$VBoxContainer/turntable_bronze_hbox/RichTextLabel.bbcode_text = "เครื่องเล่นแผ่นเสียงถ้วยทองแดง\n10คะแนน-คุณไอชื่น"
		$VBoxContainer/drum_bronze_hbox/RichTextLabel.bbcode_text = "กลองชุดถ้วยทองแดง\n10คะแนน-คุณฌโอเล"
#		silver
		$VBoxContainer/total_silver_hbox/RichTextLabel.bbcode_text = "คะแนนรวมถ้วยเงิน\n100คะแนน-คะแนนรวม"
		$VBoxContainer/mno_silver_hbox/RichTextLabel.bbcode_text = "คุณมะโนถ้วยเงิน\n100คะแนน-คุณมะโน"
		$VBoxContainer/speng_silver_hbox/RichTextLabel.bbcode_text = "คุณสะปงถ้วยเงิน\n100คะแนน-คุณสะเปง"
		$VBoxContainer/ichuen_silver_hbox/RichTextLabel.bbcode_text = "คุณไอชื่นถ้วยเงิน\n100คะแนน-คุณไอชื่น"
		$VBoxContainer/olay_silver_hbox/RichTextLabel.bbcode_text = "คุณโอเลถ้วยเงิน\n100คะแนน-คุณโอเล"
#		gold
		$VBoxContainer/total_gold_hbox/RichTextLabel.bbcode_text = "คะแนนรวมถ้วยทอง\n200คะแนน-คะแนนรวม"
		$VBoxContainer/mno_bass_gold_hbox/RichTextLabel.bbcode_text = "คุณมะโนถ้วยทอง\n200คะแนน-คุณมะโน"
		$VBoxContainer/speng_guitar_gold_hbox/RichTextLabel.bbcode_text = "คุณสะปงถ้วยทอง\n200คะแนน-คุณสะเปง"
		$VBoxContainer/ichuen_turntable_gold_hbox/RichTextLabel.bbcode_text = "คุณไอชื่นถ้วยทอง\n200คะแนน-คุณไอชื่น"
		$VBoxContainer/olay_drum_gold_hbox/RichTextLabel.bbcode_text = "คุณโอเลถ้วยทอง\n200คะแนน-คุณโอเล"
