extends Node2D

onready var PlayIntegration = get_node("/root/PlayIntegration")

func _ready():
	Global.FloatingPlay()
	$Click_.text = str(Global.speng_scores)
	
func _process(delta):
	if $Tek_abc3dz_speng.hit_speng == true :
		Global.speng_scores += 1
		$Click_.text = str(Global.speng_scores)
	if $Tek_abc3dz_speng2.hit_speng == true :
		Global.speng_scores -= 1
		$Click_.text = str(Global.speng_scores)
		$Tek_abc3dz_speng2/HitSound_speng.pitch_scale = 2.5
	if $Tek_abc3dz_speng3.hit_speng == true :
		Global.speng_scores -= 1
		$Click_.text = str(Global.speng_scores)
		$Tek_abc3dz_speng3/HitSound_speng.pitch_scale = 2.5
	if $Tek_abc3dz_speng4.hit_speng == true :
		Global.speng_scores -= 1
		$Click_.text = str(Global.speng_scores)
		$Tek_abc3dz_speng4/HitSound_speng.pitch_scale = 2.5
	if $Tek_abc3dz_speng5.hit_speng == true :
		Global.speng_scores -= 1
		$Click_.text = str(Global.speng_scores)
		$Tek_abc3dz_speng5/HitSound_speng.pitch_scale = 2.5

	$Tek_abc3dz_speng.hit_speng = false 
	$Tek_abc3dz_speng2.hit_speng = false 
	$Tek_abc3dz_speng3.hit_speng = false 
	$Tek_abc3dz_speng4.hit_speng = false 
	$Tek_abc3dz_speng5.hit_speng = false 
	
func _on_HomeBT_pressed():
	Global.FloatingStop()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/Floating/FloatingAlternative.tscn")
	
