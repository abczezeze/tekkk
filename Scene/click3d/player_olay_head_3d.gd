extends Area
var dir_y:float = 0.1
var move_speed:float = 1
var clicked:bool = false
onready var anim:AnimationPlayer = $AnimationPlayer

func _ready():
	anim.play("idle")
	dir_y = rand_range(-1,1)
	transform.origin = Vector3(0,rand_range(-2,2),-10)
	
func _process(delta):
	translate(Vector3(0,dir_y*move_speed*delta,-10))
	if transform.origin.y>2:
		dir_y = rand_range(-2,0)
	elif transform.origin.y<-2:
		dir_y = rand_range(0,2)


func _on_player_olay_head_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click") and not clicked and Global.camera_scene_a.transform.origin.z == 3:
			anim.play("head_rotation")
			move_speed+=0.3
			clicked = true
			Global.save_dict["olay_scores"]+=1
			Global.save_game()
			$OlayCap/CPUParticles.emitting = true


func _on_AnimationPlayer_animation_finished(anim_name):
	$OlayCap/CPUParticles.emitting = false
#	queue_free()
	clicked = false
