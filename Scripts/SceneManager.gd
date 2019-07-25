extends Node2D

class_name SceneManager

const _containers = ['UI', 'World']
var _root: Node2D

func _init(root: Node2D):
	_root = root

func _load_scene(name: String):
	var file_checker = File.new()
	for container in _containers:
		var node := _root.get_node(container)
		_remove_children(node)
		var scene: String = 'res://Scenes/' + container + '/' + name + '.tscn' 
		if file_checker.file_exists(scene):
			node.replace_by(load(scene).instance())
		else:
			print(scene + ' does not exists')

func _remove_children(node: Node):
	for child in node.get_children():
		child.queue_free()

func load_menu():
	_load_scene("Menu")
		
func load_settings():
	_load_scene("Options")
	
func load_game():
	_load_scene("Game")