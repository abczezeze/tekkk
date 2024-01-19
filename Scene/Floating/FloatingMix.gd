extends Node2D
var rgb=0.0 #add color when right click
func _ready():
	Global.FloatingPlay()
	$HBoxContainer/ClickMno.text = " "+str(Global.mno_scores)
	$HBoxContainer/ClickOlay.text = " "+str(Global.olay_scores)
	$HBoxContainer/ClickIchuen.text = " "+str(Global.ichuen_scores)
	$HBoxContainer/ClickSpeng.text = " "+str(Global.speng_scores)
	for n in 2:
		var mno_duplicate = $Tek_abc3dz_mno.duplicate()
		add_child(mno_duplicate)
		var olay_duplicate = $Tek_abc3dz_olay.duplicate()
		add_child(olay_duplicate)
		var ichuen_duplicate = $Tek_abc3dz_ichuen.duplicate()
		add_child(ichuen_duplicate)
		var speng_duplicate = $Tek_abc3dz_speng.duplicate()
		add_child(speng_duplicate)
	if Global.tekkk_language=="Th":
		$Label.text="แต่ละรูปมีเพืยงหนึ่งเดียว"
	
func _process(delta):
	if $Tek_abc3dz_mno.hit_mno == true :
		add_color()
		Global.mno_scores += 1
		$HBoxContainer/ClickMno.text = " "+str(Global.mno_scores)

	if $Tek_abc3dz_olay.hit_olay == true :
		add_color()
		Global.olay_scores += 1
		$HBoxContainer/ClickOlay.text = " "+str(Global.olay_scores)
		
	if $Tek_abc3dz_ichuen.hit_ichuen == true :
		add_color()
		Global.ichuen_scores += 1
		$HBoxContainer/ClickIchuen.text = " "+str(Global.ichuen_scores)
		
	if $Tek_abc3dz_speng.hit_speng == true :
		add_color()
		Global.speng_scores += 1
		$HBoxContainer/ClickSpeng.text = " "+str(Global.speng_scores)
				
	$Tek_abc3dz_olay.hit_olay = false 
	$Tek_abc3dz_mno.hit_mno = false 
	$Tek_abc3dz_ichuen.hit_ichuen = false 
	$Tek_abc3dz_speng.hit_speng = false 
	Global.total_scores = Global.speng_scores+Global.ichuen_scores+Global.olay_scores+Global.mno_scores
	$HBoxContainer/ClickT.text = " Total : "+ str(Global.total_scores)

func _on_HomeBT_pressed():
	Global.FloatingStop()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/MainMenu.tscn")
func add_color():
	if rgb<1:
		rgb+=0.1
	$Bg/musical_consert.modulate = Color(rgb,rgb,rgb,0.3)

#func _input(event: InputEvent) -> void:
#	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
#		$HBoxContainer/Label.queue_free()
#		print("clicked!")

func _on_Timer_timeout():
	$Label.visible = false
