extends Spatial


func _on_DamageButton_pressed():
	KantoEventBus.emit_player_damaged(self)


func _on_CrystalGreenButton_pressed():
	KantoEventBus.emit_player_collected_item(self, "green_crystal")


func _on_CrystalPurpleButton_pressed():
	KantoEventBus.emit_player_collected_item(self, "purple_crystal")


func _on_PauseButton_pressed():
	print("Pause Button pressed")
	KantoEventBus.emit_player_pause_game()
	
