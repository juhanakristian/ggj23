extends Node

export var spin_speed = 5.0
onready var wheel = $Wheel

export var rx = false
export var ry = false
export var rz = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if ry:
		wheel.rotation_degrees.x += delta * spin_speed
	if rx:
		wheel.rotation_degrees.y += delta * spin_speed
	if rz:
		wheel.rotation_degrees.z += delta * spin_speed

