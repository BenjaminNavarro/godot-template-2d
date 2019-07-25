extends Control

func _ready():
	pass

func _process(delta):
	if Input.is_action_just_pressed("pause_menu"):
		get_tree().paused = not get_tree().paused
		$PauseMenu.visible = get_tree().paused
