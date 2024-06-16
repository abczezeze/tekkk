extends Area
var clicked:bool = false
onready var anim:AnimationPlayer = $AnimationPlayer
export (Array,AudioStreamOGGVorbis) var sound_efx = []

func _ready():
	anim.play("idle")
	$Label3D.text = str(Global.save_dict["speng_scores"])
	transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-21)
	
func _on_player_speng_head_input_event(_camera, event, _position, _normal, _shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click") and not clicked and Global.position_z_click3d == -15:
			anim.play("head_rotation")
			clicked = true
			$Timer.wait_time-=0.2
			if $Timer.wait_time<=0:
				$Timer.wait_time = 1
			Global.save_dict["speng_scores"]+=1
			Global.save_game()
			$SpeangBody/CPUParticles.emitting = true
			transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-21)
			$Label3D.text = str(Global.save_dict["speng_scores"])
			$AudioStreamPlayer.stream = sound_efx[rand_range(0,sound_efx.size())]
			$AudioStreamPlayer.stream.loop = false
			$AudioStreamPlayer.play()

func _on_AnimationPlayer_animation_finished(_anim_name):
	$SpeangBody/CPUParticles.emitting = false
	clicked = false
	anim.play("idle")


func _on_Timer_timeout():
	transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),-21)
