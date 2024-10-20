extends Control

func _ready() -> void:
	Global.MenuAudioP()
	Global.load_game()
	$LogoNocap.visible = true
#	$AnimationPlayer.play("scale_logo")
	$AnimationPlayer.play("HomeFromCredit")
	if Global.tekkk_language=="En":
		_on_TextureButton_toggled(false)
	if Global.tekkk_language=="Th":
		_on_TextureButton_toggled(true)

func _on_SwipeLb_pressed() -> void:
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/Swipe/SwipeMix.tscn")

func _on_ClickLb_pressed() -> void:
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/Click/ClickMix.tscn")

func _on_DragLb_pressed() -> void:
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/Drag/DragMix.tscn")

func _on_click_3d_pressed() -> void:
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/click3d/click_mix_3d.tscn")

func _on_drag_3d_pressed() -> void:
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ = get_tree().change_scene("res://Scene/drag3d/drag3d_mix.tscn")
	
func _on_shoot_3d_pressed():
	Global.SceneSoundPlay()
	Global.MenuAudioS()
	var __ =  get_tree().change_scene("res://Scene/shoot3d/shoot3d_mix.tscn")

func _on_achievement_button_pressed():
	Global.SceneSoundPlay()
	var __ =  get_tree().change_scene("res://Scene/achievement_scene.tscn")
	
func _on_option_button_pressed():
	Global.SceneSoundPlay()
	var __ =  get_tree().change_scene("res://Scene/option_scene.tscn")

func _on_reset_button_pressed() -> void:
	Global.save_dict["mno_scores"]=0
	Global.save_dict["olay_scores"]=0
	Global.save_dict["ichuen_scores"]=0
	Global.save_dict["speng_scores"]=0
	Global.save_dict["mno_anim"]=false
	Global.save_dict["olay_anim"]=false
	Global.save_dict["ichuen_anim"]=false
	Global.save_dict["speng_anim"]=false
	Global.save_game()
	Global.load_game()

func _on_TextureButton_toggled(button_pressed) -> void:
	if button_pressed:
		$TextureButton_language.modulate = Color(1,1,1,2)
		Global.tekkk_language = "Th"
		$TekLb.text="เต็กเคเค"
		$ManuHome/SelectLevel.text="เลือกด่าน"
		$ManuHome/HBoxContainer/ClickLb.text="คลิก"
		$ManuHome/HBoxContainer/DragLb.text="ลาก"
		$ManuHome/HBoxContainer/SwipeLb.text="ตวัด"
		$ManuHome/level_3d/click_3d.text="คลิก"
		$ManuHome/level_3d/drag_3d.text="ลาก"
		$ManuHome/level_3d/shoot_3d.text=" ยิง "
		$ManuHome/OtherLb.text="อื่นๆ"
		$ManuHome/achievement_button.text="ความสำเร็จ"
		$ManuHome/option_button.text="ตั้งค่า"
		$ManuHome/credit_button.text="เครดิต"
		$ManuHome/reset_button.text="เริ่มค่าใหม่!"
		$credit_scene/shader_credit.text="เชดเดอร์"
		$credit_scene/shade_sub1.text="่เปล่งประกาย"
		$credit_scene/shade_sub2.text="เส้นสายรุ้ง"
		$credit_scene/sound_credit.text="เสียง"
		$credit_scene/sound_sub1.text="ชิปโทน"
		$credit_scene/font_credit.text="แบบอักษร"
		$credit_scene/font_sub1.text="สนามเด็กเล่น"
		$credit_scene/present_by.text="นำเสนอโดย"
		$credit_scene/creator.text="เอบีซีซีซีซี"
	else:
		$TextureButton_language.modulate = Color(1,1,1,1)
		Global.tekkk_language = "En"
		$TekLb.text="Tekkk"
		$ManuHome/SelectLevel.text="Select Level"
		$ManuHome/HBoxContainer/ClickLb.text="Click"
		$ManuHome/HBoxContainer/DragLb.text="Drag"
		$ManuHome/HBoxContainer/SwipeLb.text="Swipe"
		$ManuHome/level_3d/click_3d.text="click"
		$ManuHome/level_3d/drag_3d.text="drag"
		$ManuHome/level_3d/shoot_3d.text="shoot"
		$ManuHome/OtherLb.text="Other"
		$ManuHome/achievement_button.text="Achievement"
		$ManuHome/option_button.text="Option"
		$ManuHome/credit_button.text="Credit"
		$ManuHome/reset_button.text="RESET!"
		$credit_scene/shader_credit.text="Shader"
		$credit_scene/shade_sub1.text="shining-sprite-effect"
		$credit_scene/shade_sub2.text="rainbow-outline"
		$credit_scene/sound_credit.text="Sound"
		$credit_scene/sound_sub1.text="chiptone"
		$credit_scene/font_credit.text="Font"
		$credit_scene/font_sub1.text="sanamdeklen-chaya"
		$credit_scene/present_by.text="Present by"
		$credit_scene/creator.text="ABCzezeze"

func _on_credit_button_pressed():
	Global.SceneSoundPlay()
	$AnimationPlayer.play("credit_scene")

func _on_HomeBT_pressed():
	Global.HomeAudioPlay()
	$AnimationPlayer.play("HomeFromCredit")

func _on_shade_sub1_pressed():
	var __ =  OS.shell_open("https://godotshaders.com/shader/shining-sprite-effect/")

func _on_shade_sub2_pressed():
	var __ =  OS.shell_open("https://godotshaders.com/shader/rainbow-outline/")

func _on_sound_sub1_pressed():
	var __ =  OS.shell_open("https://sfbgames.itch.io/chiptone")

func _on_font_sub1_pressed():
	var __ =  OS.shell_open("https://www.f0nt.com/release/sanamdeklen-chaya/")

func _on_creator_pressed():
	var __ =  OS.shell_open("https://abczezeze.itch.io/")
