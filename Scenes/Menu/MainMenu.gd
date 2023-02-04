extends Spatial


onready var start_button = $CanvasLayer/Control/VBoxContainer/StartButton
onready var exit_button = $CanvasLayer/Control/VBoxContainer/ExitButton

# Called when the node enters the scene tree for the first time.
func _ready():
	start_button.connect("pressed", self, "_on_start_button_pressed")
	exit_button.connect("pressed", self, "_on_exit_button_pressed")


func _on_start_button_pressed():
	KantoSceneLoader.load_scene(self, "res://Scenes/Game/Level/Level.tscn")
	#KantoEventBus.emit_player_exit_game()

func _on_exit_button_pressed():
	print("Exit pressed")
	get_tree().quit()
	#KantoEventBus.emit_player_pause_game()


