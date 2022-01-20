extends Node2D

onready var PlayIntegration = get_node("/root/PlayIntegration")

func _ready():
	Global.FloatingPlay()
	$Click_.text = str(Global.olay_scores)
	
func _process(delta):
	if $Tek_abc3dz_olay.hit_olay == true :
		Global.olay_scores += 1
		$Click_.text = str(Global.olay_scores)
#		PlayIntegration.achievementsStepsOlay(Global.olay_scores*10)
#		Global.submit_total_score(Global.total_scores*10)
	if $Tek_abc3dz_olay2.hit_olay == true :
		Global.olay_scores -= 1
		$Click_.text = str(Global.olay_scores)
		$Tek_abc3dz_olay2/HitSound_olay.pitch_scale = 2.5
	if $Tek_abc3dz_olay3.hit_olay == true :
		Global.olay_scores -= 1
		$Click_.text = str(Global.olay_scores)
		$Tek_abc3dz_olay3/HitSound_olay.pitch_scale = 2.5
	if $Tek_abc3dz_olay4.hit_olay == true :
		Global.olay_scores -= 1
		$Click_.text = str(Global.olay_scores)
		$Tek_abc3dz_olay4/HitSound_olay.pitch_scale = 2.5
	if $Tek_abc3dz_olay5.hit_olay == true :
		Global.olay_scores -= 1
		$Click_.text = str(Global.olay_scores)
		$Tek_abc3dz_olay5/HitSound_olay.pitch_scale = 2.5

	$Tek_abc3dz_olay.hit_olay = false 
	$Tek_abc3dz_olay2.hit_olay = false 
	$Tek_abc3dz_olay3.hit_olay = false 
	$Tek_abc3dz_olay4.hit_olay = false 
	$Tek_abc3dz_olay5.hit_olay = false 

func _on_HomeBT_pressed():
	Global.FloatingStop()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/Floating/FloatingAlternative.tscn")
	
