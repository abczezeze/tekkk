extends Node2D

func _ready():
	Global.FloatingPlay()
	$Click_.text = str(Global.olay_scores)
	$AnimatedSprite.speed_scale=0
	for n in 14:
		var olay_add = $olay_right.duplicate()
		add_child(olay_add)
	
func _process(delta):
	if $olay_right.hit_olay == true :
		press_right()
	$olay_right.hit_olay = false 

func _on_HomeBT_pressed():
	Global.FloatingStop()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/MainMenu.tscn")
	
func press_right():
	Global.olay_scores += 1
	$Click_.text = str(Global.olay_scores)
	$AnimatedSprite.speed_scale += 1
	if $AnimatedSprite.speed_scale>=10:
		_on_HomeBT_pressed()
	if $AnimatedSprite.speed_scale==9:
		$AnimatedSprite.modulate = Color.black

func _on_Timer_timeout():
	$Label.visible = false
