extends Node2D

var is_dragging = false
onready var tween_node = $SpengRigidBody2D/Tween
onready var sprity = $SpengRigidBody2D/CollisionShape2D/Pic

func _ready():
	Global.MenuAudioS()
	$MnoRigidBody2D.position.x = rand_range(50,1000)
	$OlayRigidBody2D.position.x = rand_range(50,1000)
	$SpengRigidBody2D.position.x = rand_range(50,1000)
	$IchuenRigidBody2D.position.x = rand_range(50,1000)
	$Scores.text = str(Global.speng_scores)
	Global.DragP()

func _physics_process(delta):
	if $MnoRigidBody2D.position.y >= 1860:
		$MnoRigidBody2D.position.x = rand_range(50,1000)
		$MnoRigidBody2D.global_position.y = 0
#		$MnoRigidBody2D.modulate = Color.black
		
	if $OlayRigidBody2D.position.y >= 1860:
		$OlayRigidBody2D.position.x = rand_range(50,1000)
		$OlayRigidBody2D.global_position.y = 0
		
	if $SpengRigidBody2D.position.y >= 1860:
		$SpengRigidBody2D.position.x = rand_range(50,1000)
		$SpengRigidBody2D.global_position.y = 0
		tween_node.interpolate_property(sprity,"scale",Vector2(2,2),Vector2(1,1),1,Tween.TRANS_EXPO,Tween.EASE_OUT)
		
	if $IchuenRigidBody2D.position.y >= 1860:
		$IchuenRigidBody2D.position.x = rand_range(50,1000)
		$IchuenRigidBody2D.global_position.y = 0
		
	
func _process(delta):
	$Scores.text = str(Global.speng_scores)

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
	
func _on_BackBT_pressed():
	Global.DragS()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/MainMenu.tscn")

func _on_MnoArea2D_body_entered(body):
	if body.is_in_group("Speng"):
		Global.speng_scores += 1
		Global.AccurateAudioPlay()
#		var tween_node = $SpengRigidBody2D/Tween
#		var sprity = $SpengRigidBody2D/CollisionShape2D/Pic
		tween_node.interpolate_property(sprity,"scale",Vector2(1,1),Vector2(2,2),1,Tween.TRANS_EXPO,Tween.EASE_OUT)
		tween_node.start()


