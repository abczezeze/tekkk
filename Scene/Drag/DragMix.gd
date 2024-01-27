extends Node2D

var is_dragging = false
var total_scores = 0

func _ready():
	Global.MenuAudioS()
	Global.DragP()
	$MnoRigidBody2D.position.x = rand_range(50,1000)
	$OlayRigidBody2D.position.x = rand_range(50,1000)
	$SpengRigidBody2D.position.x = rand_range(50,1000)
	$IchuenRigidBody2D.position.x = rand_range(50,1000)
	$VBoxContainer/ClickMno.text="Mno : "+str(Global.mno_scores)
	$VBoxContainer/ClickOlay.text="Olay : "+str(Global.olay_scores)
	$VBoxContainer/ClickIchuen.text="Ichuen : "+str(Global.ichuen_scores)
	$VBoxContainer/ClickSpeng.text="Speng : "+str(Global.speng_scores)
	total_scores = Global.speng_scores+Global.ichuen_scores+Global.olay_scores+Global.mno_scores
	$TotalScores.text = "Total : "+ str(total_scores)

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
	$VBoxContainer/ClickMno.text="Mno : "+str(Global.mno_scores)
	$VBoxContainer/ClickOlay.text="Olay : "+str(Global.olay_scores)
	$VBoxContainer/ClickIchuen.text="Ichuen : "+str(Global.ichuen_scores)
	$VBoxContainer/ClickSpeng.text="Speng : "+str(Global.speng_scores)
	total_scores = Global.speng_scores+Global.ichuen_scores+Global.olay_scores+Global.mno_scores
	$TotalScores.text = "Total : "+ str(total_scores)

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging = true

func _input(event):
	if not is_dragging:
		return
		
	if event.is_action_released("ui_click"):
		is_dragging = false
	
	if is_dragging and event is InputEventMouseMotion:
		$IchuenBodyArea2D.position.x = get_viewport().get_mouse_position().x
		if $IchuenBodyArea2D.position.x <= 50:
			$IchuenBodyArea2D.position.x = 50
		elif $IchuenBodyArea2D.position.x >= 990:
			$IchuenBodyArea2D.position.x = 990

func _on_BackBT_pressed():
	Global.DragS()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/MainMenu.tscn")

func _on_IchuenArea2D_body_entered(body):
	if body.is_in_group("Ichuen"):
		Global.ichuen_scores += 1
		Global.AccurateAudioPlay()
	else:
		Global.FailedAudioPlay()
