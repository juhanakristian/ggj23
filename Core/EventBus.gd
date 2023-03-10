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


const SIGNAL_PLAYER_DEATH = "player_death"
signal player_death()

func connect_player_death(obj, method="_on_player_death"):
	var err = connect(SIGNAL_PLAYER_DEATH, obj, method)
	handle_connect_result(err, SIGNAL_PLAYER_DEATH, obj, method)

func emit_player_death():
	emit_signal(SIGNAL_PLAYER_DEATH)

const SIGNAL_RESET_GAME = "reset_game"
signal reset_game()

func connect_reset_game(obj, method="_on_reset_game"):
	var err = connect(SIGNAL_RESET_GAME, obj, method)
	handle_connect_result(err, SIGNAL_RESET_GAME, obj, method)

func emit_reset_game():
	emit_signal(SIGNAL_RESET_GAME)

const SIGNAL_PLAYER_JUMP = "player_jump"
signal player_jump()

func connect_player_jump(obj, method="_on_player_jump"):
	var err = connect(SIGNAL_PLAYER_JUMP, obj, method)
	handle_connect_result(err, SIGNAL_PLAYER_JUMP, obj, method)

func emit_player_jump():
	emit_signal(SIGNAL_PLAYER_JUMP)


const SIGNAL_PLAYER_SCORE_UPDATED = "player_score_updated"
signal player_score_updated(score)

func connect_player_score_updated(obj, method="_on_player_score_updated"):
	var err = connect(SIGNAL_PLAYER_SCORE_UPDATED, obj, method)
	handle_connect_result(err, SIGNAL_PLAYER_SCORE_UPDATED, obj, method)

func emit_player_score_updated(score):
	emit_signal(SIGNAL_PLAYER_SCORE_UPDATED, score)


const SIGNAL_PLAYER_HEALTH_UPDATED = "player_health_updated"
signal player_health_updated(health)


func connect_player_health_updated(obj, method="_on_player_health_updated"):
	var err = connect(SIGNAL_PLAYER_HEALTH_UPDATED, obj, method)
	handle_connect_result(err, SIGNAL_PLAYER_HEALTH_UPDATED, obj, method)
	
	
func emit_player_health_updated(health):
	emit_signal(SIGNAL_PLAYER_HEALTH_UPDATED, health)
