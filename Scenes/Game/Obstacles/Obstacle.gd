extends Node

onready var area = $Area
signal obstacle_body_entered


func _ready():
	area.connect("body_entered", self, "_on_body_entered")
	
func _on_body_entered(body):
	emit_signal("obstacle_body_entered")
	KantoEventBus.emit_player_damaged(self)
	#KantoEventBus.emit_player_collected_item(self, "damageitem")
	

