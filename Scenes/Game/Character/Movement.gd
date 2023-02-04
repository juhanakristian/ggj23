extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var lane = 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("move_right"):
		lane = min(lane+1,2)
	if Input.is_action_just_pressed("move_left"):
		lane = max(lane-1,0)

	var tween = get_tree().create_tween()
	var move = Vector3(0, 0, 0)
	if lane == 0:
		move = $Lane0.translation
	elif lane == 1:
		move = $Lane1.translation
	elif lane == 2:
		move = $Lane2.translation

	tween.tween_property($Player, "translation", move, 0.5)
