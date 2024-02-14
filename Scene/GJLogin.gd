extends Control

var response = ""

var mouse_pos = Vector2()

func _ready():
	Global.data_global.game_id=GameJolt.get_game_id()
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")

func _process(delta):
	mouse_pos = get_viewport().get_mouse_position()
	$WaitLb.rect_position = mouse_pos
	
	if Global.tekkk_language == "Th": 
		$HBoxContainer/UserNameLb.text="<ชื่อผู้ใช้>"
		$HBoxContainer/UserTokenLb.text="<รหัสโทเค้น>"
		$HBoxContainer/Login.text="เข้าสู่ระบบ"
		$HBoxContainer/Close.text="ปิด"
		$WaitLb.text="รอแป๊บ"
	else:
		$HBoxContainer/UserNameLb.text="Username"
		$HBoxContainer/UserTokenLb.text="Token"
		$HBoxContainer/Login.text="Login"
		$HBoxContainer/Close.text="Close"
		$WaitLb.text="one moment"
		
	Global.AchieveTrophy()
	
func _on_Login_pressed():
	Global.data_global.username=$HBoxContainer/UserName.text
	GameJolt.set_user_name($HBoxContainer/UserName.text)
	Global.data_global.user_token=$HBoxContainer/UserToken.text
	GameJolt.set_user_token($HBoxContainer/UserToken.text)
#	print(GameJolt._generate_url(GameJolt.OPERATIONS["users/auth"],Global.data_global))
	$HTTPRequest.request(GameJolt._generate_url(GameJolt.OPERATIONS["users/auth"],Global.data_global))
	$Timer.start()
	$HBoxContainer/Login.disabled=true
	$WaitLb.visible=true
	
	
func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	response = json.result
	print(response.response.success)

func _on_Close_pressed():
	self.visible=false

func _on_Timer_timeout():
	$WaitLb.visible=false
	if response.response["success"] == "true":
		$HBoxContainer/Login.disabled=false
		$HBoxContainer/Label.visible=true
		$HBoxContainer/Label.modulate=Color.green
		$AnimationPlayer.stop()
		if Global.tekkk_language == "Th":
			$HBoxContainer/Label.text="ไปกันเลย!"
		else:
			$HBoxContainer/Label.text="Let's go!"
	else:
		$HBoxContainer/Label.visible=true
		$HBoxContainer/Label.modulate=Color.red
		if Global.tekkk_language == "Th":
			$HBoxContainer/Label.text="อีกทีนะ!"
		else:
			$HBoxContainer/Label.text="Again!"
		$AnimationPlayer.play("shake")
		
func _on_AnimationPlayer_animation_finished(anim_name):
	$Timer.stop()
	$AnimationPlayer.stop()
	if Global.tekkk_language == "Th":
		$HBoxContainer/Login.text="เข้าสู่ระบบ"
	else:
		$HBoxContainer/Login.text="Login"
	$HBoxContainer/Login.disabled=false
	
