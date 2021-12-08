extends Node2D

onready var PlayIntegration = get_node("/root/PlayIntegration")

var time_start = 0
var time_now = 0

func _ready():
	Global.OneToFiveSound()
	$HomeBT.disabled = true
	$VBoxContainer/ClickMno.text = "Mno#Bass : " + str(Global.mno_scores)
	$VBoxContainer/ClickOlay.text = "Olay#Drum : " + str(Global.olay_scores)
	$VBoxContainer/ClickIchuen.text = "Ichuen#Turntable : " + str(Global.ichuen_scores)
	$VBoxContainer/ClickSpeng.text = "Speng#Guitar : " + str(Global.speng_scores)
	
func _process(delta):
	if $Tek_abc3dz_mno.hit_mno == true :
		Global.mno_scores += 1
		$VBoxContainer/ClickMno.text = "Mno#Bass : " + str(Global.mno_scores)
		$HomeBT/TextureProgress.value += 10
#		PlayIntegration.achievementsStepsMno(Global.mno_scores*10)
#		Global.submit_total_score(Global.total_scores*10)

	if $Tek_abc3dz_olay.hit_olay == true :
		Global.olay_scores += 1
		$VBoxContainer/ClickOlay.text = "Olay#Drum : " + str(Global.olay_scores)
		$HomeBT/TextureProgress.value += 10
#		PlayIntegration.achievementsStepsOlay(Global.olay_scores*10)
#		Global.submit_total_score(Global.total_scores*10)
		
	if $Tek_abc3dz_ichuen.hit_ichuen == true :
		Global.ichuen_scores += 1
		$VBoxContainer/ClickIchuen.text = "Ichuen#Turntable : " + str(Global.ichuen_scores)
		$HomeBT/TextureProgress.value += 10
#		PlayIntegration.achievementsStepsIchuen(Global.ichuen_scores*10)
#		Global.submit_total_score(Global.total_scores*10)
		
	if $Tek_abc3dz_speng.hit_speng == true :
		Global.speng_scores += 1
		$VBoxContainer/ClickSpeng.text = "Speng#Guitar : " + str(Global.speng_scores)
		$HomeBT/TextureProgress.value += 10
#		PlayIntegration.achievementsStepsSpeng(Global.speng_scores*10)
#		Global.submit_total_score(Global.total_scores*10)
				
	$Tek_abc3dz_olay.hit_olay = false 
	$Tek_abc3dz_mno.hit_mno = false 
	$Tek_abc3dz_ichuen.hit_ichuen = false 
	$Tek_abc3dz_speng.hit_speng = false 
	Global.total_scores = Global.speng_scores+Global.ichuen_scores+Global.olay_scores+Global.mno_scores
	$VBoxContainer/ClickT.text = "Total : "+ str(Global.total_scores)
	
	if Global.total_scores >= 10:
		$HomeBT.disabled = false
		$HomeBT.modulate = 65500

func _on_HomeBT_pressed():
	get_tree().change_scene("res://Scene/MainMenu.tscn")
	Global.OneToFiveStop()

func _on_Timer_timeout():
	$HomeBT/TextureProgress.value -= 1
	if $HomeBT/TextureProgress.value == 0:
		$Timer.queue_free()
