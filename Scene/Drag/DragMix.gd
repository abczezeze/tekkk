extends Node2D

var is_dragging_ichuen = false
var is_dragging_olay = false
var is_dragging_mno = false
var is_dragging_speng = false

var selected_ichuen = false
var selected_olay = false
var selected_mno = false
var selected_speng = false

var total_scores = 0

onready var speng_tween_node = $SpengBodyArea2D/Tween
onready var mno_tween_node = $MnoBodyArea2D/Tween
onready var ichuen_tween_node = $IchuenBodyArea2D/Tween
onready var olay_tween_node = $OlayBodyArea2D/Tween

onready var mno_sprite = $MnoBodyArea2D
onready var speng_sprite = $SpengBodyArea2D
onready var ichuen_sprite = $IchuenBodyArea2D
onready var olay_sprite = $OlayBodyArea2D

export (Array, Texture) var sprite_textures = []

func _ready():
	Global.MenuAudioS()
	Global.DragP()
	$MnoRigidBody2D.position.x = rand_range(50,1900)
	$OlayRigidBody2D.position.x = rand_range(50,1900)
	$SpengRigidBody2D.position.x = rand_range(50,1900)
	$IchuenRigidBody2D.position.x = rand_range(50,1900)
	$dragScene.visible = true
	$dragScene.texture = sprite_textures[rand_range(1.0,sprite_textures.size())]
	$bg.modulate = Color(rand_range(0.0,1.0),rand_range(0.0,1.0),rand_range(0.0,1.0))
	$dragScene/AnimationPlayer.play("scaleBody")
	speng_tween_node.interpolate_property(speng_sprite,"position:y",1000,2000,50,Tween.TRANS_EXPO,Tween.EASE_OUT)
	ichuen_tween_node.interpolate_property(ichuen_sprite,"position:y",1000,2000,50,Tween.TRANS_EXPO,Tween.EASE_OUT)
	olay_tween_node.interpolate_property(olay_sprite,"position:y",1000,2000,50,Tween.TRANS_EXPO,Tween.EASE_OUT)
	speng_tween_node.start()
	ichuen_tween_node.start()
	olay_tween_node.start()
	$player_full_hbox/mno_button.disabled = true
	
func _physics_process(_delta):
	if $MnoRigidBody2D.position.y >= 1100:
		$MnoRigidBody2D.position.x = rand_range(50,1900)
		$MnoRigidBody2D.global_position.y = 0
		$MnoRigidBody2D.global_position.normalized()
		
	if $OlayRigidBody2D.position.y >= 1100:
		$OlayRigidBody2D.position.x = rand_range(50,1900)
		$OlayRigidBody2D.global_position.y = 0
		$OlayRigidBody2D.global_position.normalized()
		
	if $SpengRigidBody2D.position.y >= 1100:
		$SpengRigidBody2D.position.x = rand_range(50,1900)
		$SpengRigidBody2D.global_position.y = 0
		$SpengRigidBody2D.global_position.normalized()
		
	if $IchuenRigidBody2D.position.y >= 1100:
		$IchuenRigidBody2D.position.x = rand_range(50,1900)
		$IchuenRigidBody2D.global_position.y = 0
		$IchuenRigidBody2D.global_position.normalized()
		
func _process(_delta):
	$MnoBodyArea2D/ClickMno.text = str(Global.save_dict["mno_scores"])
	$SpengBodyArea2D/ClickSpeng.text = str(Global.save_dict["speng_scores"])
	$OlayBodyArea2D/ClickOlay.text = str(Global.save_dict["olay_scores"])
	$IchuenBodyArea2D/ClickIchuen.text = str(Global.save_dict["ichuen_scores"])
	$HBoxContainer/TotalScores.text = str(Global.total_scores)

func _input(event):
	if selected_ichuen:
		if not is_dragging_ichuen:
			return
	if selected_olay:
		if not is_dragging_olay:
			return
	if selected_mno:
		if not is_dragging_mno:
			return
	if selected_speng:
		if not is_dragging_speng:
			return
	
	if event.is_action_released("ui_click"):
		is_dragging_ichuen = false
		is_dragging_olay = false
		is_dragging_mno = false
		is_dragging_speng = false
		selected_ichuen = false
		selected_olay = false
		selected_mno = false
		selected_speng = false
	
	if is_dragging_ichuen and event is InputEventMouseMotion:
		$IchuenBodyArea2D.position.x = get_viewport().get_mouse_position().x
		if $IchuenBodyArea2D.position.x <= 50:
			$IchuenBodyArea2D.position.x = 50
		elif $IchuenBodyArea2D.position.x >= 1870:
			$IchuenBodyArea2D.position.x = 1870
	if is_dragging_olay and event is InputEventMouseMotion:
		$OlayBodyArea2D.position.x = get_viewport().get_mouse_position().x
		if $OlayBodyArea2D.position.x <= 50:
			$OlayBodyArea2D.position.x = 50
		elif $OlayBodyArea2D.position.x >= 1870:
			$OlayBodyArea2D.position.x = 1870
	if is_dragging_mno and event is InputEventMouseMotion:
		$MnoBodyArea2D.position.x = get_viewport().get_mouse_position().x
		if $MnoBodyArea2D.position.x <= 50:
			$MnoBodyArea2D.position.x = 50
		elif $MnoBodyArea2D.position.x >= 1870:
			$MnoBodyArea2D.position.x = 1870
	if is_dragging_speng and event is InputEventMouseMotion:
		$SpengBodyArea2D.position.x = get_viewport().get_mouse_position().x
		if $SpengBodyArea2D.position.x <= 50:
			$SpengBodyArea2D.position.x = 50
		elif $SpengBodyArea2D.position.x >= 1870:
			$SpengBodyArea2D.position.x = 1870
#body event
func _on_Area2D_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging_ichuen = true
		
func _on_OlayBodyArea2D_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging_olay = true

func _on_MnoBodyArea2D_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging_mno = true

func _on_SpengBodyArea2D_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging_speng = true

#body entered
func _on_MnoBodyArea2D_body_entered(body):
	if body.is_in_group("Mno"):
		Global.save_dict["mno_scores"]+=1
		Global.AccurateAudioPlay()
		Global.save_game()
		$MnoRigidBody2D.scale = Vector2(3.0,3.0)
	elif body.is_in_group("Ichuen") or body.is_in_group("Olay") or body.is_in_group("Speng"):
		Global.FailedAudioPlay()
		Global.save_dict["mno_scores"]-=1

func _on_SpengBodyArea2D_body_entered(body):
	if body.is_in_group("Speng"):
		Global.save_dict["speng_scores"]+=1
		Global.AccurateAudioPlay()
		Global.save_game()
		$SpengRigidBody2D.scale = Vector2(3,3)
	elif body.is_in_group("Mno") or body.is_in_group("Olay") or body.is_in_group("Ichuen"):
		Global.FailedAudioPlay()
		Global.save_dict["speng_scores"]-=1
		
func _on_IchuenArea2D_body_entered(body):
	if body.is_in_group("Ichuen"):
		Global.save_dict["ichuen_scores"]+=1
		Global.AccurateAudioPlay()
		Global.save_game()
		$IchuenRigidBody2D.scale = Vector2(3,3)
	elif body.is_in_group("Mno") or body.is_in_group("Olay") or body.is_in_group("Speng"):
		Global.FailedAudioPlay()
		Global.save_dict["ichuen_scores"]-=1
		
func _on_OlayBodyArea2D_body_entered(body):
	if body.is_in_group("Olay"):
		Global.save_dict["olay_scores"]+=1
		Global.AccurateAudioPlay()
		Global.save_game()
		$OlayRigidBody2D.scale = Vector2(3,3)
	elif body.is_in_group("Mno") or body.is_in_group("Ichuen") or body.is_in_group("Speng"):
		Global.FailedAudioPlay()
		Global.save_dict["olay_scores"]-=1

func _on_Tween_speng_tween_completed(_object, _key):
	$SpengBodyArea2D/Tween.stop(speng_sprite,"position:y")
func _on_Tween_mno_tween_completed(_object, _key):
	$MnoBodyArea2D/Tween.stop(mno_sprite,"position:y")
func _on_Tween_olay_tween_completed(_object, _key):
	$OlayBodyArea2D/Tween.stop(olay_sprite,"position:y")
func _on_Tween_ichuen_tween_completed(_object, _key):
	$IchuenBodyArea2D/Tween.stop(ichuen_sprite,"position:y")

#if selected the full img character for drag
func _on_mno_button_pressed():
	selected_mno=true
	$IchuenBodyArea2D.position.y=2000
	$SpengBodyArea2D.position.y=2000
	$OlayBodyArea2D.position.y=2000
	mno_tween_node.interpolate_property(mno_sprite,"position:y",2000,1000,1,Tween.TRANS_EXPO,Tween.EASE_OUT)
	mno_tween_node.start()
	$player_full_hbox/speng_button.disabled = false
	$player_full_hbox/olay_button.disabled = false
	$player_full_hbox/mno_button.disabled = true
	$player_full_hbox/ichuen_button.disabled = false

func _on_olay_button_pressed():
	selected_olay=true
	$IchuenBodyArea2D.position.y=2000
	$SpengBodyArea2D.position.y=2000
	$MnoBodyArea2D.position.y=2000
	olay_tween_node.interpolate_property(olay_sprite,"position:y",2000,1000,1,Tween.TRANS_QUART,Tween.EASE_OUT)
	olay_tween_node.start()
	$player_full_hbox/speng_button.disabled = false
	$player_full_hbox/olay_button.disabled = true
	$player_full_hbox/mno_button.disabled = false
	$player_full_hbox/ichuen_button.disabled = false

func _on_ichuen_button_pressed():
	selected_ichuen=true
	$OlayBodyArea2D.position.y=2000
	$SpengBodyArea2D.position.y=2000
	$MnoBodyArea2D.position.y=2000
	ichuen_tween_node.interpolate_property(ichuen_sprite,"position:y",2000,1000,1,Tween.TRANS_QUINT,Tween.EASE_OUT)
	ichuen_tween_node.start()
	$player_full_hbox/speng_button.disabled = false
	$player_full_hbox/olay_button.disabled = false
	$player_full_hbox/mno_button.disabled = false
	$player_full_hbox/ichuen_button.disabled = true

func _on_speng_button_pressed():
	selected_speng=true
	$IchuenBodyArea2D.position.y=2000
	$OlayBodyArea2D.position.y=2000
	$MnoBodyArea2D.position.y=2000
	speng_tween_node.interpolate_property(speng_sprite,"position:y",2000,1000,1,Tween.TRANS_EXPO,Tween.EASE_OUT)
	speng_tween_node.start()
	$player_full_hbox/speng_button.disabled = true
	$player_full_hbox/olay_button.disabled = false
	$player_full_hbox/mno_button.disabled = false
	$player_full_hbox/ichuen_button.disabled = false
	
func _on_home_button_pressed():
	Global.DragS()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")
