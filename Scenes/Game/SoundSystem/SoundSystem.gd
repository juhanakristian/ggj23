extends Spatial

onready var asp_music = $ASPMusic
onready var asp_walk_sfx = $ASPWalkSFX
onready var asp_pickup_green_sfx = $ASPPickupGreenSFX
onready var asp_pickup_purple_sfx = $ASPPickupPurpleSFX
onready var asp_damaged_sfx = $ASPDamagedSFX



func _ready():
	KantoEventBus.connect_player_damaged(self)
	KantoEventBus.connect_player_collected_item(self)
	KantoEventBus.connect_player_pause_game(self)
	KantoEventBus.connect_player_exit_game(self)
	
	
func _on_player_pause_game():
	print("Pause event called..")
	asp_music.stop()
	
func _on_player_exit_game():
	print("exit game requested..")

	
func _on_player_damaged(obj_ref):
	print("Player damaged by object: %s" % obj_ref)
	asp_damaged_sfx.play()
	
func _on_player_collected_item(obj_ref, item_type):
	print("Test Sound System: Player collected item (%s) : %s " % [item_type, obj_ref])
	
	if item_type == "green_crystal":
		asp_pickup_green_sfx.play()
	if item_type == "purple_crystal":
		asp_pickup_purple_sfx.play()

	
