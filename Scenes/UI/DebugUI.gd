class_name DebugUI extends CanvasLayer


onready var event_log = $Control/VBoxContainer/EventLog
onready var fps_label = $Control/VBoxContainer/FPSLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	KantoEventBus.connect_player_damaged(self)
	KantoEventBus.connect_player_collected_item(self)
	KantoEventBus.connect_player_pause_game(self)	
	KantoEventBus.connect_player_exit_game(self)
	
	KantoEventBus.connect_player_jump(self)
	
func _on_player_pause_game():
	log_event("Pause game requested..")
	
	
func _on_player_jump():
	log_event("Player jumped")
	
func _on_player_exit_game():
	log_event("exit game requested..")
	
func _on_player_damaged(obj_ref):
	log_event("Player damaged by object: %s" % obj_ref)
	
func _on_player_collected_item(obj_ref, item_type):
	log_event("Player collected item (%s) : %s " % [item_type, obj_ref])
	
func log_event(message):
	event_log.newline()
	event_log.add_text(message)
	
func _process(_delta):
	var fps = Engine.get_frames_per_second()
	fps_label.set_text("FPS:%s" % fps)
	
