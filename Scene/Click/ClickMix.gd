extends Node2D
var total_scores = 0
func _ready():
	Global.FloatingPlay()
	
func _process(delta):
	if $Tek_abc3dz_mno.hit_mno == true :
		Global.mno_scores += 1
		$PanelContainer/MnoAnimatedSprite.playing=Global.mno_animte_sprite

	if $Tek_abc3dz_olay.hit_olay == true :
		Global.olay_scores += 1
		$PanelContainer/OlayAnimatedSprite.playing=Global.olay_animte_sprite
		
	if $Tek_abc3dz_ichuen.hit_ichuen == true :
		Global.ichuen_scores += 1
		$PanelContainer/IchuenAnimatedSprite.playing=Global.ichuen_animte_sprite
		
	if $Tek_abc3dz_speng.hit_speng == true :
		Global.speng_scores += 1
		$PanelContainer/SpengAnimatedSprite.playing=Global.speng_animte_sprite

	$Tek_abc3dz_olay.hit_olay = false
	$Tek_abc3dz_mno.hit_mno = false
	$Tek_abc3dz_ichuen.hit_ichuen = false
	$Tek_abc3dz_speng.hit_speng = false
	total_scores = Global.speng_scores+Global.ichuen_scores+Global.olay_scores+Global.mno_scores
	tekkk_language(Global.tekkk_language)

func _on_HomeBT_pressed():
	get_tree().change_scene("res://Scene/MainMenu.tscn")
	Global.HomeAudioPlay()
	Global.FloatingStop()

func tekkk_language(language):
	if language == "En":
		$VBoxContainer/ClickMno.text="Mno : "+str(Global.mno_scores)
		$VBoxContainer/ClickOlay.text="Olay : "+str(Global.olay_scores)
		$VBoxContainer/ClickIchuen.text="Ichuen : "+str(Global.ichuen_scores)
		$VBoxContainer/ClickSpeng.text="Speng : "+str(Global.speng_scores)
		$TotalScores.text = "Total : "+ str(total_scores)
	if language == "Th":
		$VBoxContainer/ClickMno.text="คุณมโน : "+str(Global.mno_scores)
		$VBoxContainer/ClickOlay.text="คุณโอเล : "+str(Global.olay_scores)
		$VBoxContainer/ClickIchuen.text="คุณไอชื่น : "+str(Global.ichuen_scores)
		$VBoxContainer/ClickSpeng.text="คุณสเปง : "+str(Global.speng_scores)
		$TotalScores.text = "คะแนนรวม : "+ str(total_scores)
