extends Area
var dir_x:float = 0.1
var dir_y:float = 0.1
var move_speed:float = 1
var clicked:bool = false
onready var anim:AnimationPlayer = $AnimationPlayer

func _ready():
	anim.play("idle")
	transform.origin = Vector3(rand_range(-1,1),rand_range(-2,2),0)
	

func _on_player_speng_head_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click") and not clicked and Global.camera_scene_a.transform.origin.z == 3:
			anim.play("head_rotation")
			move_speed+=0.3
			clicked = true
			Global.save_dict["speng_scores"]+=1
			Global.save_game()
			$SpeangBody/CPUParticles.emitting = true


func _on_AnimationPlayer_animation_finished(anim_name):
	$SpeangBody/CPUParticles.emitting = false
#	queue_free()
	clicked = false


func _on_Timer_timeout():
	transform.origin = Vector3(rand_range(-1,1),rand_range(-2,2),0)
