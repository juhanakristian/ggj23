extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var lane = 1;

func _move_to_lane(lane):
	var move = Vector3(0, 0, 0)
	if lane == 0:
		move = $Lane0.translation
	elif lane == 1:
		move = $Lane1.translation
	elif lane == 2:
		move = $Lane2.translation
	var tween = get_tree().create_tween()
	tween.tween_property($Player, "translation", move, 0.5)

func _jump():
	var tween = get_tree().create_tween()
	var translation = $Player.translation
	tween.tween_property($Player, "translation", translation + Vector3(0, 3, 0), 0.3).set_trans(Tween.TRANS_QUAD)
	tween.tween_property($Player, "translation", translation, 0.3).set_trans(Tween.TRANS_QUART)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("move_right"):
		lane = min(lane+1,2)
		_move_to_lane(lane)
	if Input.is_action_just_pressed("move_left"):
		lane = max(lane-1,0)
		_move_to_lane(lane)

	var isMoving = $Player.translation.x != $Lane1.translation.x && $Player.translation.x != $Lane2.translation.x && $Player.translation.x != $Lane0.translation.x
	var isJumping = $Player.translation.y != 0
	if !isJumping && !isMoving && Input.is_action_just_pressed("jump"):
		_jump()

