class_name DebugUI extends CanvasLayer


onready var event_log = $Control/EventLog

# Called when the node enters the scene tree for the first time.
func _ready():
	KantoEventBus.connect_player_damaged(self)
	KantoEventBus.connect_player_pause_game(self)	
	KantoEventBus.connect_player_exit_game(self)
	
func _on_player_pause_game():
	log_event("Pause game requested..")
	
func _on_player_exit_game():
	log_event("exit game requested..")
	
func _on_player_damaged(obj):
	log_event("Player damaged by object: %s" % obj)
	
func log_event(message):
	event_log.newline()
	event_log.add_text(message)
	
