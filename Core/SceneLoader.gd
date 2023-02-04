extends Node

# This SceneLoader is based on following example:
# https://dicode1q.blogspot.com/2022/10/background-loading-in-godot-dicode.html

onready var loading_scene = preload("res://Scenes/Loading/Loading.tscn")

func load_scene(cur_scene, new_scene):
	var loading_scene_instance = loading_scene.instance()
	get_tree().get_root().call_deferred("add_child", loading_scene_instance)
	
	var loader = ResourceLoader.load_interactive(new_scene)
	cur_scene.queue_free()
	
	yield(get_tree().create_timer(0.5),"timeout")
	
	while true:
		var poll_res = loader.poll()
		if poll_res == OK:
			print("Loading..")
		
		elif poll_res  == ERR_FILE_EOF:
			var scene = loader.get_resource().instance()
			get_tree().get_root().call_deferred("add_child", scene)
			loading_scene_instance.queue_free()
			return
		
		else:
			print("Error occured within SceneLoader..")
			return		


		
