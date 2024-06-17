extends Spatial
var is_dragging_ichuen:bool = false
var is_selected_ichuen:bool = false
var is_dragging_mno:bool = false
var is_selected_mno:bool = false
var is_dragging_olay:bool = false
var is_selected_olay:bool = false
var is_dragging_speng:bool = false
var is_selected_speng:bool = false

var rigidbody_turntable_c = preload("res://Scene/drag3d/rigidbody_turntable.tscn")
var rigidbody_turntable:RigidBody
var rigidbody_guitar_c = preload("res://Scene/drag3d/rigidbody_guitar.tscn")
var rigidbody_guitar:RigidBody
var rigidbody_drum_c = preload("res://Scene/drag3d/rigidbody_drum.tscn")
var rigidbody_drum:RigidBody
var rigidbody_bass_c = preload("res://Scene/drag3d/rigidbody_bass.tscn")
var rigidbody_bass:RigidBody
var player_position:Array = [0,4]

func _ready():
	random_first()
	new_turntable()
	new_guitar()
	new_drum()
	new_bass()
	
func _physics_process(_delta):
	$player_ichuen_full/Label3D.text = str(Global.save_dict["ichuen_scores"])
	$player_mno_full/Label3D.text = str(Global.save_dict["mno_scores"])
	$player_olay_full/Label3D.text = str(Global.save_dict["olay_scores"])
	$player_speng_full/Label3D.text = str(Global.save_dict["speng_scores"])
	
	if rigidbody_turntable.transform.origin.y<-1:
		rigidbody_turntable.queue_free()
		new_turntable()
	if rigidbody_guitar.transform.origin.y<-1:
		rigidbody_guitar.queue_free()
		new_guitar()
	if rigidbody_drum.transform.origin.y<-1:
		rigidbody_drum.queue_free()
		new_drum()
	if rigidbody_bass.transform.origin.y<-1:
		rigidbody_bass.queue_free()
		new_bass()
		
func new_turntable():
	rigidbody_turntable = rigidbody_turntable_c.instance()
	add_child(rigidbody_turntable)
	rigidbody_turntable.transform.origin = Vector3(rand_range(-2,2),6,0)
	rigidbody_turntable.connect("body_entered",self,"on_turnatable_body_entered")

func on_turnatable_body_entered(body):
	if body.is_in_group("ichuen"):
		Global.save_dict["ichuen_scores"] += 1
	else:
		Global.save_dict["ichuen_scores"] -= 1
	
func new_guitar():
	rigidbody_guitar = rigidbody_guitar_c.instance()
	add_child(rigidbody_guitar)
	rigidbody_guitar.transform.origin.y = 6
	rigidbody_guitar.transform.origin.x = rand_range(-2,2)
	rigidbody_guitar.connect("body_entered",self,"on_guitar_body_entered")

func on_guitar_body_entered(body):
	if body.is_in_group("speng"):
		Global.save_dict["speng_scores"] += 1
	else:
		Global.save_dict["speng_scores"] -= 1

func new_drum():
	rigidbody_drum = rigidbody_drum_c.instance()
	add_child(rigidbody_drum)
	rigidbody_drum.transform.origin.y = 6
	rigidbody_drum.transform.origin.x = rand_range(-2,2)
	rigidbody_drum.connect("body_entered",self,"on_drum_body_entered")

func on_drum_body_entered(body):
	if body.is_in_group("olay"):
		Global.save_dict["olay_scores"] += 1
	else:
		Global.save_dict["olay_scores"] -= 1
	
func new_bass():
	rigidbody_bass = rigidbody_bass_c.instance()
	add_child(rigidbody_bass)
	rigidbody_bass.transform.origin.y = 6
	rigidbody_bass.transform.origin.x = rand_range(-2,2)
	rigidbody_bass.connect("body_entered",self,"on_bass_body_entered")

func on_bass_body_entered(body):
	if body.is_in_group("mno"):
		Global.save_dict["mno_scores"] += 1
	else:
		Global.save_dict["mno_scores"] -= 1

func _input(event: InputEvent) -> void:
	if not is_dragging_ichuen and is_selected_ichuen:
		return
	if not is_dragging_mno and is_selected_mno:
		return
	if not is_dragging_olay and is_selected_olay:
		return
	if not is_dragging_speng and is_selected_speng: 
		return
	
	if Input.is_action_just_released("ui_click"):
		is_dragging_ichuen = false
		is_dragging_mno = false
		is_dragging_olay = false
		is_dragging_speng = false
		is_selected_ichuen = false
		is_selected_mno = false
		is_selected_olay = false
		is_selected_speng = false
		
	if is_dragging_ichuen and event is InputEventMouseMotion:
		var mouse_pos = get_viewport().get_mouse_position()
		var origin = $Camera.project_ray_origin(mouse_pos)
		var end = $Camera.project_ray_normal(mouse_pos)
		var depth = origin.distance_to($player_ichuen_full.transform.origin)
		var final_pos = origin + end * depth
		$player_ichuen_full.transform.origin.x = final_pos.x
		if $player_ichuen_full.transform.origin.x<=-2:
			$player_ichuen_full.transform.origin.x=-2
		elif $player_ichuen_full.transform.origin.x>=2:
			$player_ichuen_full.transform.origin.x=2
			
	if is_dragging_mno and event is InputEventMouseMotion:
		var mouse_pos = get_viewport().get_mouse_position()
		var origin = $Camera.project_ray_origin(mouse_pos)
		var end = $Camera.project_ray_normal(mouse_pos)
		var depth = origin.distance_to($player_mno_full.transform.origin)
		var final_pos = origin + end * depth
		$player_mno_full.transform.origin.x = final_pos.x
		if $player_mno_full.transform.origin.x<=-2:
			$player_mno_full.transform.origin.x=-2
		elif $player_mno_full.transform.origin.x>=2:
			$player_mno_full.transform.origin.x=2
			
	if is_dragging_olay and event is InputEventMouseMotion:
		var mouse_pos = get_viewport().get_mouse_position()
		var origin = $Camera.project_ray_origin(mouse_pos)
		var end = $Camera.project_ray_normal(mouse_pos)
		var depth = origin.distance_to($player_mno_full.transform.origin)
		var final_pos = origin + end * depth
		$player_olay_full.transform.origin.x = final_pos.x
		if $player_olay_full.transform.origin.x<=-2:
			$player_olay_full.transform.origin.x=-2
		elif $player_olay_full.transform.origin.x>=2:
			$player_olay_full.transform.origin.x=2
			
	if is_dragging_speng and event is InputEventMouseMotion:
		var mouse_pos = get_viewport().get_mouse_position()
		var origin = $Camera.project_ray_origin(mouse_pos)
		var end = $Camera.project_ray_normal(mouse_pos)
		var depth = origin.distance_to($player_speng_full.transform.origin)
		var final_pos = origin + end * depth
		$player_speng_full.transform.origin.x = final_pos.x
		if $player_speng_full.transform.origin.x<=-2:
			$player_speng_full.transform.origin.x=-2
		elif $player_speng_full.transform.origin.x>=2:
			$player_speng_full.transform.origin.x=2

func _on_back_button_pressed():
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")
	
func random_first():
	$player_ichuen_full.transform.origin.x = player_position[randi() % player_position.size()]
	if $player_ichuen_full.transform.origin.x == 0:
		is_selected_ichuen = true
		$player_mno_full.transform.origin.x = 4
		$player_olay_full.transform.origin.x = 4
		$player_speng_full.transform.origin.x = 4
		return
	$player_mno_full.transform.origin.x = player_position[randi() % player_position.size()]
	if $player_mno_full.transform.origin.x == 0:
		is_selected_mno = true
		$player_ichuen_full.transform.origin.x = 4
		$player_olay_full.transform.origin.x = 4
		$player_speng_full.transform.origin.x = 4
		return
	$player_olay_full.transform.origin.x = player_position[randi() % player_position.size()]
	if $player_olay_full.transform.origin.x == 0:
		is_selected_olay = true
		$player_ichuen_full.transform.origin.x = 4
		$player_mno_full.transform.origin.x = 4
		$player_speng_full.transform.origin.x = 4
		return
	else:
		is_selected_speng = true
		$player_speng_full.transform.origin.x = 0
		$player_ichuen_full.transform.origin.x = 4
		$player_olay_full.transform.origin.x = 4
		$player_mno_full.transform.origin.x = 4
		return

func _on_player_ichuen_full_input_event(_camera, event, _position, _normal, _shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging_ichuen = true
		
func _on_player_mno_full_input_event(_camera, event, _position, _normal, _shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging_mno = true
		
func _on_player_olay_full_input_event(_camera, event, _position, _normal, _shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging_olay = true
		
func _on_player_speng_full_input_event(_camera, event, _position, _normal, _shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging_speng = true

