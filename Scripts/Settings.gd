class_name Settings

var _config: ConfigFile = ConfigFile.new()

var music: bool setget set_music
var fx: bool setget set_fx

signal music_changed
signal fx_changed

func load_settings():
	var err = _config.load("user://settings.cfg")
	if err == OK:
		music = _config.get_value("audio", "music", true)
		fx = _config.get_value("audio", "fx", true)
	else:
		print("Can't open the settings file")
		
	emit_signal("music_changed", music)
	emit_signal("fx_changed", fx)

func save_setting():
	if _config.save("user://settings.cfg") != OK:
		print("Can't save the settings file")

func set_music(var on: bool):
	music = on
	_config.set_value("audio", "music", music)
	save_setting()
	emit_signal("music_changed", music)
	
func set_fx(var on: bool):
	fx = on
	_config.set_value("audio", "fx", fx)
	save_setting()
	emit_signal("fx_changed", fx)
	