extends Node

onready var area = $Area
signal obstacle_body_entered


func _ready():
	area.connect("body_entered", self, "_on_body_entered")
	
func _on_body_entered(body):
	print("Body has entered")
	emit_signal("obstacle_body_entered")
	

