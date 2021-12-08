extends Node2D

onready var PlayIntegration = get_node("/root/PlayIntegration")

func _ready():
	Global.OneToFiveSound()
	$ClickMno.text = "Mno : " + str(Global.mno_scores)
	
	
func _process(delta):
	if $Tek_abc3dz_mno.hit_mno == true :
		Global.mno_scores += 1
		$ClickMno.text = "Mno : " + str(Global.mno_scores)
#		PlayIntegration.achievementsStepsMno(Global.mno_scores*10)
#		Global.submit_total_score(Global.total_scores*10)
	if $Tek_abc3dz_mno2.hit_mno == true :
		Global.mno_scores -= 1
		$ClickMno.text = "Mno : " + str(Global.mno_scores)
		$Tek_abc3dz_mno2/HitSound_mno.pitch_scale = 2.5
	if $Tek_abc3dz_mno3.hit_mno == true :
		Global.mno_scores -= 1
		$ClickMno.text = "Mno : " + str(Global.mno_scores)
		$Tek_abc3dz_mno3/HitSound_mno.pitch_scale = 2.5
	if $Tek_abc3dz_mno4.hit_mno == true :
		Global.mno_scores -= 1
		$ClickMno.text = "Mno : " + str(Global.mno_scores)
		$Tek_abc3dz_mno4/HitSound_mno.pitch_scale = 2.5
	if $Tek_abc3dz_mno5.hit_mno == true :
		Global.mno_scores -= 1
		$ClickMno.text = "Mno : " + str(Global.mno_scores)
		$Tek_abc3dz_mno5/HitSound_mno.pitch_scale = 2.5

	$Tek_abc3dz_mno.hit_mno = false 
	$Tek_abc3dz_mno2.hit_mno = false 
	$Tek_abc3dz_mno3.hit_mno = false 
	$Tek_abc3dz_mno4.hit_mno = false 
	$Tek_abc3dz_mno5.hit_mno = false 
	
func _on_HomeBT_pressed():
	Global.OneToFiveStop()
	Global.HomeAudioPlay()
	get_tree().change_scene("res://Scene/MainMenu.tscn")
	
