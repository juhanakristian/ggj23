extends Spatial

# Game related definitions
var score = 0;
var health = 3;

# Debug related
export var invincible = false
onready var debug_ui = $DebugUI



onready var player = $Character2;
onready var retry_ui = $RetryUI;
onready var haiku = $RetryUI/Control;

# Called when the node enters the scene tree for the first time.
func _ready():
	KantoEventBus.connect_player_damaged(self)
	KantoEventBus.connect_player_collected_item(self)
	KantoEventBus.connect_reset_game(self)

func _on_player_damaged(obj_ref):
	if not invincible:
		health -= 1;

	KantoEventBus.emit_player_health_updated(health)

	if health <= 0:
		# player._on_game_over()
		#haiku._randomize_haiku()
		KantoEventBus.emit_player_death()
		retry_ui.show()

		# KantoSceneLoader.load_scene(self, "res://Scenes/Game/Level/EnvTestLevel.tscn")
	
func _on_player_collected_item(obj_ref, item_type):
	if item_type == "green_crystal":
		score += 1
	if item_type == "purple_crystal":
		score += 10
	
	KantoEventBus.emit_player_score_updated(score)

func _on_reset_game():
	retry_ui.hide()
	# Resets the score and health
	score = 0;
	health = 3;

func _process(_delta):
	handle_debug_commands()
	if Input.is_action_just_pressed("quit_game"):
		get_tree().quit()

# Cheats and debugs
func handle_debug_commands():
	if Input.is_action_just_pressed("ui_page_up"):
		debug_ui.visible = true;
	
	if Input.is_action_just_pressed("ui_page_down"):
		debug_ui.visible = false;
		
	if Input.is_action_just_pressed("ui_home"):
		invincible = !invincible
	
