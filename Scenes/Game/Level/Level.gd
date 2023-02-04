extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	KantoEventBus.connect_player_damaged(self)
	KantoEventBus.connect_player_collected_item(self)

func _on_player_damaged(obj_ref):
	print("Player dead")
	KantoSceneLoader.load_scene(self, "res://Scenes/Menu/MainMenu.tscn")

	
func _on_player_collected_item(obj_ref, item_type):
	if item_type == "coin":
		score += 1
		print("Score: ", score)
		# KantoEventBus.emit_player_scored(self, score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
