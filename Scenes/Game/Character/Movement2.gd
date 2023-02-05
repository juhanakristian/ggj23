extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var lane = 1;
export var jump_height = 3;
export var jump_duration = 0.5;
export var speed = 30;
var dead = false;
onready var player = $Player
onready var animation = $Player/AnimationPlayer
onready var original_y = $Player.translation.y

func _move_to_lane(lane):
	var move = player.translation.x
	if lane == 0:
		move = $Lane0.translation.x
	elif lane == 1:
		move = $Lane1.translation.x
	elif lane == 2:
		move = $Lane2.translation.x
	var tween = get_tree().create_tween()
	tween.tween_property(player, "translation:x", move, 0.5)

func _jump():
	var tween = get_tree().create_tween()
	var translation = player.translation
	tween.tween_property(player, "translation:y", translation.y + jump_height, jump_duration / 2).set_trans(Tween.TRANS_EXPO)
	tween.tween_property(player, "translation:y", original_y, jump_duration / 2).set_trans(Tween.TRANS_QUART)

func _ready():
	KantoEventBus.connect_player_death(self, "_on_game_over")
	KantoEventBus.connect_reset_game(self)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dead:
		return

	var is_moving = player.translation.x != $Lane1.translation.x && player.translation.x != $Lane2.translation.x && player.translation.x != $Lane0.translation.x
	var is_jumping = player.translation.y != original_y

	if Input.is_action_just_pressed("move_right"):
		lane = min(lane+1,2)
		_move_to_lane(lane)
	if Input.is_action_just_pressed("move_left"):
		lane = max(lane-1,0)
		_move_to_lane(lane)

	if !is_jumping && Input.is_action_just_pressed("jump"):
		_jump()

	
	rotation_degrees.x = rotation_degrees.x - delta * speed
	speed += 0.2 * delta
	

func _on_game_over():
	dead = true
	animation.stop()

func _on_reset_game():
	speed = 30
	dead = false
	rotation_degrees.x = 0
	player.translation.x = $Lane1.translation.x
	player.translation.y = original_y
	lane = 1
	animation.play()

