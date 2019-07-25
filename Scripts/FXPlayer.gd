extends Node2D

class_name FXPlayer

export var fx_players_count := 10

func _ready():
	for i in range(fx_players_count):
		add_child(AudioStreamPlayer2D.new())

func _get_fx_player() -> AudioStreamPlayer2D:
	for element in get_children():
		var player := element as AudioStreamPlayer2D
		if not player.playing:
			return player
	return null

func enable(state: bool):
	for element in get_children():
		var player := element as AudioStreamPlayer2D
		if state:
			player.volume_db = 0
		else:
			player.volume_db = -100
		#player.stream_paused = not state

func play(stream: AudioStream):
	play_at(stream, Vector2(0,0))
	
func play_at(stream: AudioStream, position: Vector2):
	var player := _get_fx_player()
	if player:
		player.stream = stream
		player.position = position
		player.playing = true
	else:
		print("All FX players busy, can't play stream", stream)
	
