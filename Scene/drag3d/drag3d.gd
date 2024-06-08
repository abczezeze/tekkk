extends Spatial
var is_dragging:bool
var rigidbody_turntable_c = preload("res://Scene/drag3d/rigidbody_turntable.tscn")
var rigidbody_turntable:RigidBody
var rigidbody_guitar_c = preload("res://Scene/drag3d/rigidbody_guitar.tscn")
var rigidbody_guitar:RigidBody
var rigidbody_drum_c = preload("res://Scene/drag3d/rigidbody_drum.tscn")
var rigidbody_drum:RigidBody
var rigidbody_bass_c = preload("res://Scene/drag3d/rigidbody_bass.tscn")
var rigidbody_bass:RigidBody
var player_position:Array = [0,3]

func _ready():
	random_first()
	
	
	new_turntable()
	new_guitar()
	new_drum()
	new_bass()
	
func _physics_process(delta):
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
		
func _input(event: InputEvent) -> void:
	if not is_dragging:
		return
	
	if Input.is_action_just_released("ui_click"):
		is_dragging = false
	
	if event is InputEventMouseMotion:
		var mouse_pos = get_viewport().get_mouse_position()
		var origin = $Camera.project_ray_origin(mouse_pos)
		var end = $Camera.project_ray_normal(mouse_pos)
		var depth = origin.distance_to($player_mno_full.transform.origin)
		var final_pos = origin + end * depth
		$player_mno_full.transform.origin.x = final_pos.x
		

func _on_player_ichuen_full_input_event(camera, event, position, normal, shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging = true

func _on_player_ichuen_full_body_entered(body):
	if body.is_in_group("turntable"):
		Global.save_dict["ichuen_scores"]+=1
	else:
		Global.save_dict["ichuen_scores"]-=1
	$player_ichuen_full/Label3D.text = str(Global.save_dict["ichuen_scores"])
		
func new_turntable():
	rigidbody_turntable = rigidbody_turntable_c.instance()
	add_child(rigidbody_turntable)
	rigidbody_turntable.transform.origin.y = 6
	rigidbody_turntable.transform.origin.x = rand_range(-2,2)

func new_guitar():
	rigidbody_guitar = rigidbody_guitar_c.instance()
	add_child(rigidbody_guitar)
	rigidbody_guitar.transform.origin.y = 6
	rigidbody_guitar.transform.origin.x = rand_range(-2,2)

func new_drum():
	rigidbody_drum = rigidbody_drum_c.instance()
	add_child(rigidbody_drum)
	rigidbody_drum.transform.origin.y = 6
	rigidbody_drum.transform.origin.x = rand_range(-2,2)
	
func new_bass():
	rigidbody_bass = rigidbody_bass_c.instance()
	add_child(rigidbody_bass)
	rigidbody_bass.transform.origin.y = 6
	rigidbody_bass.transform.origin.x = rand_range(-2,2)

func random_first():
	$player_ichuen_full.transform.origin.x = player_position[randi() % player_position.size()]
	if $player_ichuen_full.transform.origin.x == 0:
		$player_mno_full.transform.origin.x = 3
		$player_olay_full.transform.origin.x = 3
		$player_speng_full.transform.origin.x = 3
		return
	$player_mno_full.transform.origin.x = player_position[randi() % player_position.size()]
	if $player_mno_full.transform.origin.x == 0:
		$player_ichuen_full.transform.origin.x = 3
		$player_olay_full.transform.origin.x = 3
		$player_speng_full.transform.origin.x = 3
		return
	$player_olay_full.transform.origin.x = player_position[randi() % player_position.size()]
	if $player_olay_full.transform.origin.x == 0:
		$player_ichuen_full.transform.origin.x = 3
		$player_mno_full.transform.origin.x = 3
		$player_speng_full.transform.origin.x = 3
		return
	$player_speng_full.transform.origin.x = player_position[randi() % player_position.size()]
	if $player_speng_full.transform.origin.x == 0:
		$player_ichuen_full.transform.origin.x = 3
		$player_olay_full.transform.origin.x = 3
		$player_mno_full.transform.origin.x = 3
		return


func _on_player_mno_full_input_event(camera, event, position, normal, shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging = true


func _on_player_olay_full_input_event(camera, event, position, normal, shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging = true


func _on_player_speng_full_input_event(camera, event, position, normal, shape_idx):
	if event.is_action_pressed("ui_click"):
		is_dragging = true


func _on_player_mno_full_body_entered(body):
	pass # Replace with function body.


func _on_player_olay_full_body_entered(body):
	pass # Replace with function body.


func _on_player_speng_full_body_entered(body):
	pass # Replace with function body.


func _on_Button_pressed():
	Global.HomeAudioPlay()
	Global.MenuAudioP()
	var __ = get_tree().change_scene("res://Scene/MainMenu.tscn")
