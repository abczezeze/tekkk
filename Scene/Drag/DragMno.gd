extends Node2D

var is_dragging = false

func _ready():
	Global.DragP()
	$MnoRigidBody2D.position.x = rand_range(50,1000)
	$OlayRigidBody2D.position.x = rand_range(50,1000)
	$SpengRigidBody2D.position.x = rand_range(50,1000)
	$IchuenRigidBody2D.position.x = rand_range(50,1000)
	$Scores.text = str(Global.olay_scores)

func _physics_process(delta):
	if $MnoRigidBody2D.position.y >= 1860:
		$MnoRigidBody2D.position.x = rand_range(50,1000)
		$MnoRigidBody2D.global_position.y = 0
	if $OlayRigidBody2D.position.y >= 1860:
		$OlayRigidBody2D.position.x = rand_range(50,1000)
		$OlayRigidBody2D.global_position.y = 0
	if $SpengRigidBody2D.position.y >= 1860:
		$SpengRigidBody2D.position.x = rand_range(50,1000)
		$SpengRigidBody2D.global_position.y = 0
	if $IchuenRigidBody2D.position.y >= 1860:
		$IchuenRigidBody2D.position.x = rand_range(50,1000)
		$IchuenRigidBody2D.global_position.y = 0
		
func _process(delta):
	$Scores.text = str(Global.mno_scores)

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
		elif $BodyArea2D.position.x >= 990:
			$BodyArea2D.position.x = 990
	
func _on_MnoArea2D_body_entered(body):
	if body.is_in_group("Mno"):
		Global.mno_scores += 1
		Global.AccurateAudioPlay()
	else:
		Global.mno_scores -= 1
		Global.FailedAudioPlay()

func _on_BackBT_pressed():
	Global.DragS()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/Drag/DragAlternative.tscn")
