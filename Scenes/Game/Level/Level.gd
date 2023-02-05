extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score = 0;
var health = 3;

export var invincible = false

onready var player = $Character2;
onready var retry_ui = $RetryUI;
onready var haiku = $RetryUI/Control;

# Called when the node enters the scene tree for the first time.
func _ready():
	KantoEventBus.connect_player_damaged(self)
	KantoEventBus.connect_player_collected_item(self)

func _on_player_damaged(obj_ref):
	if not invincible:
		health -= 1;

	if health <= 0:
		player._on_game_over()
		haiku._randomize_haiku()
		retry_ui.show()

		# KantoSceneLoader.load_scene(self, "res://Scenes/Game/Level/EnvTestLevel.tscn")
	
func _on_player_collected_item(obj_ref, item_type):
	if item_type == "green_crystal":
		score += 1
	if item_type == "purple_crystal":
		score += 10
		# KantoEventBus.emit_player_scored(self, score)

func _input(event):
	if health > 0:
		return

	if event is InputEventKey:
		if event.pressed:
			KantoSceneLoader.load_scene(self, "res://Scenes/Game/Level/EnvTestLevel.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
