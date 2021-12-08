extends Node2D

onready var PlayIntegration = get_node("/root/PlayIntegration")

func _ready():
	Global.OneToFiveSound()
	$Click_.text = "Speng : " + str(Global.speng_scores)
	
func _process(delta):
	if $Tek_abc3dz_speng.hit_speng == true :
		Global.speng_scores += 1
		$Click_.text = "Speng : " + str(Global.speng_scores)
#		PlayIntegration.achievementsStepsSpeng(Global.speng_scores*10)
#		Global.submit_total_score(Global.total_scores*10)
	if $Tek_abc3dz_speng2.hit_speng == true :
		Global.speng_scores -= 1
		$Click_.text = "Speng : " + str(Global.speng_scores)
		$Tek_abc3dz_speng2/HitSound_speng.pitch_scale = 2.5
	if $Tek_abc3dz_speng3.hit_speng == true :
		Global.speng_scores -= 1
		$Click_.text = "Speng : " + str(Global.speng_scores)
		$Tek_abc3dz_speng3/HitSound_speng.pitch_scale = 2.5
	if $Tek_abc3dz_speng4.hit_speng == true :
		Global.speng_scores -= 1
		$Click_.text = "Speng : " + str(Global.speng_scores)
		$Tek_abc3dz_speng4/HitSound_speng.pitch_scale = 2.5
	if $Tek_abc3dz_speng5.hit_speng == true :
		Global.speng_scores -= 1
		$Click_.text = "Speng : " + str(Global.speng_scores)
		$Tek_abc3dz_speng5/HitSound_speng.pitch_scale = 2.5

	$Tek_abc3dz_speng.hit_speng = false 
	$Tek_abc3dz_speng2.hit_speng = false 
	$Tek_abc3dz_speng3.hit_speng = false 
	$Tek_abc3dz_speng4.hit_speng = false 
	$Tek_abc3dz_speng5.hit_speng = false 
	
func _on_HomeBT_pressed():
	Global.OneToFiveStop()
	Global.HomeAudioPlay()
	get_tree().change_scene("res://Scene/MainMenu.tscn")
	
