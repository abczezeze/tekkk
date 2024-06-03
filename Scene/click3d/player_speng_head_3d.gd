extends Area
var clicked:bool = false
onready var anim:AnimationPlayer = $AnimationPlayer

func _ready():
	anim.play("idle")
	transform.origin = Vector3(rand_range(-1,1),rand_range(-3,3),0)
	

func _on_player_speng_head_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click") and not clicked:
			anim.play("head_rotation")
			clicked = true
			$Timer.wait_time-=0.2
			Global.save_dict["speng_scores"]+=1
			Global.save_game()
			$SpeangBody/CPUParticles.emitting = true
			transform.origin = Vector3(rand_range(-1,1),rand_range(-3,3),0)


func _on_AnimationPlayer_animation_finished(anim_name):
	$SpeangBody/CPUParticles.emitting = false
#	queue_free()
	clicked = false
	anim.play("idle")


func _on_Timer_timeout():
	transform.origin = Vector3(rand_range(-1,1),rand_range(-3,3),0)
	anim.play("idle")
