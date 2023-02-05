extends Node

# Provides an error message when connecting to signal fails 
func handle_connect_result(err, signal_name, obj, method):
	if err != 0:
		print("ERROR::[%s] %s with %s: %s" % [signal_name, obj, method,err])
	

## Signal which informs that the player has been damaged
const SIGNAL_PLAYER_DAMAGED = "player_damaged"
signal player_damaged(obj_ref)

func connect_player_damaged(obj, method="_on_player_damaged"):
	var err = connect(SIGNAL_PLAYER_DAMAGED, obj, method)
	handle_connect_result(err, SIGNAL_PLAYER_DAMAGED, obj, method)

func emit_player_damaged(obj_ref):
	emit_signal(SIGNAL_PLAYER_DAMAGED, obj_ref)


## Signal which informs that the player has collected item
const SIGNAL_PLAYER_COLLECTED_ITEM = "player_collected_item"
signal player_collected_item(obj_ref, item_type)

func connect_player_collected_item(obj, method="_on_player_collected_item"):
	var err = connect(SIGNAL_PLAYER_COLLECTED_ITEM, obj, method)
	handle_connect_result(err, SIGNAL_PLAYER_COLLECTED_ITEM, obj, method)

func emit_player_collected_item(obj_ref, item_type):
	emit_signal(SIGNAL_PLAYER_COLLECTED_ITEM, obj_ref, item_type)



# Event when player request exits game
const SIGNAL_PLAYER_EXIT_GAME = "player_exit_game"
signal player_exit_game()

func connect_player_exit_game(obj, method="_on_player_exit_game"):
	var err = connect(SIGNAL_PLAYER_EXIT_GAME, obj, method)
	handle_connect_result(err, SIGNAL_PLAYER_EXIT_GAME, obj, method)

func emit_player_exit_game():
	emit_signal(SIGNAL_PLAYER_EXIT_GAME)


## Event when player request pause
const SIGNAL_PLAYER_PAUSE_GAME = "player_pause_game"
signal player_pause_game()

func connect_player_pause_game(obj, method="_on_player_pause_game"):
	var err = connect(SIGNAL_PLAYER_PAUSE_GAME, obj, method)
	handle_connect_result(err, SIGNAL_PLAYER_PAUSE_GAME, obj, method)

func emit_player_pause_game():
	print("Emitting signal pause game")
	emit_signal(SIGNAL_PLAYER_PAUSE_GAME)

