extends VBoxContainer

onready var _root: Main = get_tree().get_root().get_node("Root")

# Called when the node enters the scene tree for the first time.
func _ready(): 
	# warning-ignore:return_value_discarded
	$Start/Button.connect("button_down", self, "start_game")
	# warning-ignore:return_value_discarded
	$Options/Button.connect("button_down", self, "open_options")
	# warning-ignore:return_value_discarded
	$Exit/Button.connect("button_down", self, "exit_game")
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		_root.scene_manager.load_game()	
	
func start_game():
	if _root:
		_root.scene_manager.load_game()

func open_options():
	if _root:
		_root.scene_manager.load_settings()

func exit_game():
	get_tree().quit()