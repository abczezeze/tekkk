extends Node2D

onready var PlayIntegration = get_node("/root/PlayIntegration")

var time_start = 0
var time_now = 0

func _ready():
	Global.FloatingPlay()
#	$HomeBT.disabled = true
	$VBoxContainer/ClickMno.text = str(Global.mno_scores)
	$VBoxContainer/ClickOlay.text = str(Global.olay_scores)
	$VBoxContainer/ClickIchuen.text = str(Global.ichuen_scores)
	$VBoxContainer/ClickSpeng.text = str(Global.speng_scores)
	
func _process(delta):
	if $Tek_abc3dz_mno.hit_mno == true :
		Global.mno_scores += 1
		$VBoxContainer/ClickMno.text = str(Global.mno_scores)

	if $Tek_abc3dz_olay.hit_olay == true :
		Global.olay_scores += 1
		$VBoxContainer/ClickOlay.text = str(Global.olay_scores)
		
	if $Tek_abc3dz_ichuen.hit_ichuen == true :
		Global.ichuen_scores += 1
		$VBoxContainer/ClickIchuen.text = str(Global.ichuen_scores)
		
	if $Tek_abc3dz_speng.hit_speng == true :
		Global.speng_scores += 1
		$VBoxContainer/ClickSpeng.text = str(Global.speng_scores)
				
	$Tek_abc3dz_olay.hit_olay = false 
	$Tek_abc3dz_mno.hit_mno = false 
	$Tek_abc3dz_ichuen.hit_ichuen = false 
	$Tek_abc3dz_speng.hit_speng = false 
	Global.total_scores = Global.speng_scores+Global.ichuen_scores+Global.olay_scores+Global.mno_scores
	$ClickT.text = "Total : "+ str(Global.total_scores)
	
#	if Global.total_scores >= 10:
#		$HomeBT.disabled = false
#		$HomeBT.modulate = 65500

func _on_HomeBT_pressed():
	get_tree().change_scene("res://Scene/MainMenu.tscn")
	Global.FloatingStop()

