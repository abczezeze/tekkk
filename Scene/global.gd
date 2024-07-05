extends Node

var tekkk_language:String = "En"
const FILE_NAME:String = "user://game-data.json"
var total_scores:float

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

func _process(_delta):
	total_scores = save_dict.mno_scores+save_dict.speng_scores+save_dict.ichuen_scores+save_dict.olay_scores
	
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
#		print(data)
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


