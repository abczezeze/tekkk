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

func _ready():
	Global.MenuAudioS()
	Global.DragP()
	$MnoRigidBody2D.position.x = rand_range(50,1000)
	$OlayRigidBody2D.position.x = rand_range(50,1000)
	$SpengRigidBody2D.position.x = rand_range(50,1000)
	$IchuenRigidBody2D.position.x = rand_range(50,1000)
	mno_tween_node.interpolate_property(mno_sprite,"position:y",1800,3000,50,Tween.TRANS_EXPO,Tween.EASE_OUT)
	speng_tween_node.interpolate_property(speng_sprite,"position:y",1800,3000,50,Tween.TRANS_EXPO,Tween.EASE_OUT)
	ichuen_tween_node.interpolate_property(ichuen_sprite,"position:y",1800,3000,50,Tween.TRANS_EXPO,Tween.EASE_OUT)
	olay_tween_node.interpolate_property(olay_sprite,"position:y",1800,3000,50,Tween.TRANS_EXPO,Tween.EASE_OUT)
	mno_tween_node.start()
	speng_tween_node.start()
	ichuen_tween_node.start()
	olay_tween_node.start()
	
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
	total_scores = Global.save_dict["mno_scores"]+Global.save_dict["olay_scores"]+Global.save_dict["ichuen_scores"]+Global.save_dict["speng_scores"]
	tekkk_language(Global.tekkk_language)

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
		elif $IchuenBodyArea2D.position.x >= 990:
			$IchuenBodyArea2D.position.x = 990
	if is_dragging_olay and event is InputEventMouseMotion:
		$OlayBodyArea2D.position.x = get_viewport().get_mouse_position().x
		if $OlayBodyArea2D.position.x <= 50:
			$OlayBodyArea2D.position.x = 50
		elif $OlayBodyArea2D.position.x >= 990:
			$OlayBodyArea2D.position.x = 990
	if is_dragging_mno and event is InputEventMouseMotion:
		$MnoBodyArea2D.position.x = get_viewport().get_mouse_position().x
		if $MnoBodyArea2D.position.x <= 50:
			$MnoBodyArea2D.position.x = 50
		elif $MnoBodyArea2D.position.x >= 990:
			$MnoBodyArea2D.position.x = 990
	if is_dragging_speng and event is InputEventMouseMotion:
		$SpengBodyArea2D.position.x = get_viewport().get_mouse_position().x
		if $SpengBodyArea2D.position.x <= 50:
			$SpengBodyArea2D.position.x = 50
		elif $SpengBodyArea2D.position.x >= 990:
			$SpengBodyArea2D.position.x = 990
		
func _on_BackBT_pressed():
	Global.DragS()
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	get_tree().change_scene("res://Scene/MainMenu.tscn")

#body event
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging_ichuen = true
		
func _on_OlayBodyArea2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging_olay = true

func _on_MnoBodyArea2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging_mno = true

func _on_SpengBodyArea2D_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging_speng = true

#body entered
func _on_MnoBodyArea2D_body_entered(body):
	if body.is_in_group("Mno"):
		Global.save_dict["mno_scores"]+=1
		Global.AccurateAudioPlay()
		Global.save_game()
	else:
		Global.FailedAudioPlay()

func _on_SpengBodyArea2D_body_entered(body):
	if body.is_in_group("Speng"):
		Global.save_dict["speng_scores"]+=1
		Global.AccurateAudioPlay()
		Global.save_game()
	else:
		Global.FailedAudioPlay()
		
func _on_IchuenArea2D_body_entered(body):
	if body.is_in_group("Ichuen"):
		Global.save_dict["ichuen_scores"]+=1
		Global.AccurateAudioPlay()
		Global.save_game()
	else:
		Global.FailedAudioPlay()
		
func _on_OlayBodyArea2D_body_entered(body):
	if body.is_in_group("Olay"):
		Global.save_dict["olay_scores"]+=1
		Global.AccurateAudioPlay()
		Global.save_game()
	else:
		Global.FailedAudioPlay()

func tekkk_language(language):
	if language == "En":
		$VBoxContainer/ClickMno.text="Mno : "+str(Global.save_dict["mno_scores"])
		$VBoxContainer/ClickOlay.text="Olay : "+str(Global.save_dict["olay_scores"])
		$VBoxContainer/ClickIchuen.text="Ichuen : "+str(Global.save_dict["ichuen_scores"])
		$VBoxContainer/ClickSpeng.text="Speng : "+str(Global.save_dict["speng_scores"])
		$TotalScores.text = "Total : "+str(total_scores)
	if language == "Th":
		$VBoxContainer/ClickMno.text="คุณมโน : "+str(Global.save_dict["mno_scores"])
		$VBoxContainer/ClickOlay.text="คุณโอเล : "+str(Global.save_dict["olay_scores"])
		$VBoxContainer/ClickIchuen.text="คุณไอชื่น : "+str(Global.save_dict["ichuen_scores"])
		$VBoxContainer/ClickSpeng.text="คุณสเปง : "+str(Global.save_dict["speng_scores"])
		$TotalScores.text = "คะแนนรวม : "+str(total_scores)

func _on_Tween_speng_tween_completed(object, key):
	$SpengBodyArea2D/Tween.stop(speng_sprite,"position:y")
func _on_Tween_mno_tween_completed(object, key):
	$MnoBodyArea2D/Tween.stop(mno_sprite,"position:y")
func _on_Tween_olay_tween_completed(object, key):
	$OlayBodyArea2D/Tween.stop(olay_sprite,"position:y")
func _on_Tween_ichuen_tween_completed(object, key):
	$IchuenBodyArea2D/Tween.stop(ichuen_sprite,"position:y")

#if selected the full img character for drag
func _on_FullMno_pressed():
	selected_mno=true
	$IchuenBodyArea2D.position.y=3000
	$SpengBodyArea2D.position.y=3000
	$OlayBodyArea2D.position.y=3000
	mno_tween_node.interpolate_property(mno_sprite,"position:y",3000,1800,1,Tween.TRANS_EXPO,Tween.EASE_OUT)
	mno_tween_node.start()

func _on_FulOlay_pressed():
	selected_olay=true
	$IchuenBodyArea2D.position.y=3000
	$SpengBodyArea2D.position.y=3000
	$MnoBodyArea2D.position.y=3000
	olay_tween_node.interpolate_property(olay_sprite,"position:y",3000,1800,1,Tween.TRANS_QUART,Tween.EASE_OUT)
	olay_tween_node.start()

func _on_FullIchuen_pressed():
	selected_ichuen=true
	$OlayBodyArea2D.position.y=3000
	$SpengBodyArea2D.position.y=3000
	$MnoBodyArea2D.position.y=3000
	ichuen_tween_node.interpolate_property(ichuen_sprite,"position:y",3000,1800,1,Tween.TRANS_QUINT,Tween.EASE_OUT)
	ichuen_tween_node.start()

func _on_FullSpeng_pressed():
	selected_speng=true
	$IchuenBodyArea2D.position.y=3000
	$OlayBodyArea2D.position.y=3000
	$MnoBodyArea2D.position.y=3000
	speng_tween_node.interpolate_property(speng_sprite,"position:y",3000,1800,1,Tween.TRANS_EXPO,Tween.EASE_OUT)
	speng_tween_node.start()
