extends Node2D

onready var PlayIntegration = get_node("/root/PlayIntegration")

func _ready():
	Global.FloatingPlay()
	$Click_.text = str(Global.ichuen_scores)
	
func _process(delta):
	if $Tek_abc3dz_ichuen.hit_ichuen == true :
		Global.ichuen_scores += 1
		$Click_.text = str(Global.ichuen_scores)
	if $Tek_abc3dz_ichuen2.hit_ichuen == true :
		Global.ichuen_scores -= 1
		$Click_.text = str(Global.ichuen_scores)
		$Tek_abc3dz_ichuen2/HitSound_ichuen.pitch_scale = 2.5
	if $Tek_abc3dz_ichuen3.hit_ichuen == true :
		Global.ichuen_scores -= 1
		$Click_.text = str(Global.ichuen_scores)
		$Tek_abc3dz_ichuen3/HitSound_ichuen.pitch_scale = 2.5
	if $Tek_abc3dz_ichuen4.hit_ichuen == true :
		Global.ichuen_scores -= 1
		$Click_.text = str(Global.ichuen_scores)
		$Tek_abc3dz_ichuen4/HitSound_ichuen.pitch_scale = 2.5
	if $Tek_abc3dz_ichuen5.hit_ichuen == true :
		Global.ichuen_scores -= 1
		$Click_.text = str(Global.ichuen_scores)
		$Tek_abc3dz_ichuen5/HitSound_ichuen.pitch_scale = 2.5

	$Tek_abc3dz_ichuen.hit_ichuen = false 
	$Tek_abc3dz_ichuen2.hit_ichuen = false 
	$Tek_abc3dz_ichuen3.hit_ichuen = false 
	$Tek_abc3dz_ichuen4.hit_ichuen = false 
	$Tek_abc3dz_ichuen5.hit_ichuen = false 
	
func submit_total_score(score : int):
	PlayIntegration.unlock_achievements(score)
	PlayIntegration.achievementsSteps(score)

func _on_HomeBT_pressed():
	Global.FloatingStop()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/Floating/FloatingAlternative.tscn")
	
