extends Node

var tekkk_language = "En"

const FILE_NAME = "user://game-data.json"

var data_global = {
	"game_id": "",
	"username": "",
	"user_token": ""
}

var save_dict = {
	"mno_scores" : 0,
	"speng_scores" : 0,
	"ichuen_scores" : 0,
	"olay_scores" : 0,
	"mno_anim" : false,
	"speng_anim" : false,
	"ichuen_anim" : false,
	"olay_anim" : false
	}

func save_game():
	var file = File.new()
	file.open(FILE_NAME, File.WRITE)
	file.store_string(to_json(save_dict))
	file.close()

func load_game():
	var file = File.new()
	if file.file_exists(FILE_NAME):
		file.open(FILE_NAME, File.READ)
		var data = parse_json(file.get_as_text())
		print(data)
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			save_dict = data
		else:
			printerr("Corrupted data!")
	else:
		printerr("No saved data!")
	
func HomeAudioPlay():
	$HomeScene.play()

func AccurateAudioPlay():
	$Accurate.play()

func FailedAudioPlay():
	$Failed.play()
	
func SceneSoundPlay():
	$SceneSound.play()
	
func MenuAudioP():
	$MenuAudio.play()
func MenuAudioS():
	$MenuAudio.stop()

func FloatingPlay():
	$FloatingScene.play()
func FloatingStop():
	$FloatingScene.stop()
	
func DragP():
	$DragScene.play()
func DragS():
	$DragScene.stop()
	
func SwipePlay():
	$SwipeScene.play()
func SwipeStop():
	$SwipeScene.stop()

func BassP():
	$BassSound.play()
func GuitarP():
	$GuitarSound.play()
func DrumP():
	$DrumSound.play()
func TurntableP():
	$TurntableSound.play()

func AchieveTrophy():
	var total = save_dict.mno_scores + save_dict.speng_scores + save_dict.ichuen_scores + save_dict.olay_scores
	if total == 5:
		GameJolt.trophies_add_achieved("223528")
	elif total == 10:
		GameJolt.trophies_add_achieved("223530")
	elif save_dict.mno_scores >= 10:
		GameJolt.trophies_add_achieved("223539")
	elif save_dict.speng_scores == 10:
		GameJolt.trophies_add_achieved("223540")
	elif save_dict.ichuen_scores == 10:
		GameJolt.trophies_add_achieved("223541")
	elif save_dict.olay_scores == 10:
		GameJolt.trophies_add_achieved("223542")
	elif total == 100:
		GameJolt.trophies_add_achieved("223531")
	elif save_dict.mno_scores == 100:
		GameJolt.trophies_add_achieved("223535")
	elif save_dict.speng_scores == 100:
		GameJolt.trophies_add_achieved("223536")
	elif save_dict.ichuen_scores == 100:
		GameJolt.trophies_add_achieved("223537")
	elif save_dict.olay_scores == 100:
		GameJolt.trophies_add_achieved("223538")
	elif total == 200:
		GameJolt.trophies_add_achieved("223532")
	elif save_dict.mno_scores == 200:
		GameJolt.trophies_add_achieved("223534")
	elif save_dict.speng_scores == 200:
		GameJolt.trophies_add_achieved("223543")
	elif save_dict.ichuen_scores == 200:
		GameJolt.trophies_add_achieved("223544")
	elif save_dict.olay_scores == 200:
		GameJolt.trophies_add_achieved("223545")
