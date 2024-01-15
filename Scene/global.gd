extends Node

var total_scores = 0
var mno_scores = 0
var olay_scores = 0
var speng_scores = 0
var ichuen_scores = 0
#var wrong_scores = 0
	
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

func BassP():
	$BassSound.play()
func GuitarP():
	$GuitarSound.play()
func DrumP():
	$DrumSound.play()
func TurntableP():
	$TurntableSound.play()
