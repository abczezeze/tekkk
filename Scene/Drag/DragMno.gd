extends Node2D

var is_dragging = false

func _ready():
#	print(get_viewport().size)
	Global.SixToNineSound()
	$MnoRigidBody2D.position.x = rand_range(50,700)
	$OlayRigidBody2D.position.x = rand_range(50,700)
	$SpengRigidBody2D.position.x = rand_range(50,700)
	$IchuenRigidBody2D.position.x = rand_range(50,700)
	$Scores.text = "Mno : " + str(Global.olay_scores)

func _physics_process(delta):
	if $MnoRigidBody2D.position.y >= 1200:
		$MnoRigidBody2D.position.x = rand_range(50,700)
		$MnoRigidBody2D.global_position.y = 0
		
	if $OlayRigidBody2D.position.y >= 1200:
		$OlayRigidBody2D.position.x = rand_range(50,700)
		$OlayRigidBody2D.global_position.y = 0
		
	if $SpengRigidBody2D.position.y >= 1200:
		$SpengRigidBody2D.position.x = rand_range(50,700)
		$SpengRigidBody2D.global_position.y = 0
		
	if $IchuenRigidBody2D.position.y >= 1200:
		$IchuenRigidBody2D.position.x = rand_range(50,700)
		$IchuenRigidBody2D.global_position.y = 0
		
	
func _process(delta):
	$Scores.text = "Mno : " + str(Global.mno_scores)

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging = true

func _input(event):
	if not is_dragging:
		return
		
	if event.is_action_released("ui_click"):
		is_dragging = false
	
	if is_dragging and event is InputEventMouseMotion:
		$BodyArea2D.position.x = get_viewport().get_mouse_position().x
		if $BodyArea2D.position.x <= 50:
			$BodyArea2D.position.x = 50
		elif $BodyArea2D.position.x >= 630:
			$BodyArea2D.position.x = 630
	
func _on_HomeBT_pressed():
	Global.SixToNineStop()
	Global.HomeAudioPlay()
	get_tree().change_scene("res://Scene/MainMenu.tscn")

func _on_MnoArea2D_body_entered(body):
	if body.is_in_group("Mno"):
		Global.mno_scores += 1
		Global.AccurateAudioPlay()
#		PlayIntegration.achievementsStepsMno(Global.mno_scores*10)
#		Global.submit_total_score(Global.total_scores*10)
	else:
		Global.mno_scores -= 1
		Global.FailedAudioPlay()