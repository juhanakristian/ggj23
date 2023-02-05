extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var lane = 1;
export var jump_height = 3;
export var jump_duration = 0.5;
export var speed = 20;
var paused = false;
onready var player = $Player
onready var animation = $Player/AnimationPlayer

func _move_to_lane(lane):
	var move = player.translation
	if lane == 0:
		move.x = $Lane0.translation.x
	elif lane == 1:
		move.x = $Lane1.translation.x
	elif lane == 2:
		move.x = $Lane2.translation.x
	elif lane == 3:
		move.x = $Lane3.translation.x
	var tween = get_tree().create_tween()
	tween.tween_property(player, "translation", move, 0.5)

func _jump():
	var tween = get_tree().create_tween()
	var translation = player.translation
	tween.tween_property(player, "translation", translation + Vector3(0, jump_height, 0), jump_duration / 2).set_trans(Tween.TRANS_EXPO)
	tween.tween_property(player, "translation", translation, jump_duration / 2).set_trans(Tween.TRANS_QUART)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var is_moving = player.translation.x != $Lane1.translation.x && player.translation.x != $Lane2.translation.x && player.translation.x != $Lane0.translation.x
	var is_jumping = player.translation.y != 0

	if Input.is_action_just_pressed("move_right"):
		lane = min(lane+1,3)
		_move_to_lane(lane)
	if Input.is_action_just_pressed("move_left"):
		lane = max(lane-1,0)
		_move_to_lane(lane)

	if Input.is_action_just_pressed("jump"):
		_jump()

	
	rotation_degrees.x = rotation_degrees.x - delta * speed
	

func _on_game_over():
	set_process(false)
	animation.stop()

