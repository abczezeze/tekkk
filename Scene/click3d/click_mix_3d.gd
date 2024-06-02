extends Spatial

func _ready():
	Global.camera_scene_a = $Camera


func _on_TextureButton_up_pressed():
	Global.camera_scene_a.transform.origin.z -=5


func _on_TextureButton2_down_pressed():
	Global.camera_scene_a.transform.origin.z +=5
