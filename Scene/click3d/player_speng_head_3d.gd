extends Area
var clicked:bool = false
onready var anim:AnimationPlayer = $AnimationPlayer
export (Array,AudioStreamOGGVorbis) var sound_efx = []

func _ready():
	anim.play("idle")
	$Label3D.text = str(Global.save_dict["speng_scores"])
	transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),0)
	
func _process(delta):
	print($Timer.time_left)
	if $Timer.time_left <= 0.1:
		transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),0)
		
func _on_player_speng_head_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_click") and not clicked:
			anim.play("head_rotation")
			clicked = true
			$Timer.wait_time-=0.2
			if $Timer.wait_time<=0:
				$Timer.wait_time = 1
			Global.save_dict["speng_scores"]+=1
			Global.save_game()
			$SpeangBody/CPUParticles.emitting = true
			transform.origin = Vector3(rand_range(-2,2),rand_range(-4,4),0)
			$Label3D.text = str(Global.save_dict["speng_scores"])
			$AudioStreamPlayer.stream = sound_efx[rand_range(0,sound_efx.size())]
			$AudioStreamPlayer.stream.loop = false
			$AudioStreamPlayer.play()

func _on_AnimationPlayer_animation_finished(anim_name):
	$SpeangBody/CPUParticles.emitting = false
	clicked = false
	anim.play("idle")
