extends VBoxContainer

onready var _root: Main = get_tree().get_root().get_node("Root")

# Called when the node enters the scene tree for the first time.
func _ready(): 
	# warning-ignore:return_value_discarded
	$Music/Button.connect("button_down", self, "toggle_music")
	# warning-ignore:return_value_discarded
	$FX/Button.connect("button_down", self, "toggle_fx")
	# warning-ignore:return_value_discarded
	$Return/Button.connect("button_down", self, "open_main_menu")
	
	update_menu()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		_root.scene_manager.load_menu()		
	
func update_menu():
	if not _root:
		return
		
	$Music.item_name = 'MUSIC ON' if _root.settings.music else 'MUSIC OFF'
	$FX.item_name = 'SOUND EFFECTS ON' if _root.settings.fx else 'SOUND EFFECTS OFF'	
	
func toggle_music():
	if _root:
		_root.settings.music = not _root.settings.music
		update_menu()
	
func toggle_fx():
	if _root:
		_root.settings.fx = not _root.settings.fx
		update_menu()
	
func open_main_menu():
	if _root:
		_root.scene_manager.load_menu()
