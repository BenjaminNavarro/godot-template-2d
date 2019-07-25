extends Node2D

class_name Main

var settings: Settings = Settings.new()
var scene_manager: SceneManager = SceneManager.new(self)

func _ready():
	# warning-ignore:return_value_discarded
	settings.connect("music_changed", self, "_set_music")
	# warning-ignore:return_value_discarded
	settings.connect("fx_changed", self, "_set_fx")
	settings.load_settings()
		
	scene_manager.load_menu()

func _set_music(state: bool):
	$BackgroundMusic.playing = state

func _set_fx(state: bool):
	$FXPlayer.enable(state)

