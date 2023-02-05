extends HBoxContainer


onready var lantern1 = $Lantern1
onready var lantern2 = $Lantern2
onready var lantern3 = $Lantern3

func set_health(health):
	if health == 0:
		set_visible(false)
	if health == 3:
		set_visible(true)
		
	if health == 2:
		set_visible(false)
		lantern1.visible = true
		lantern2.visible = true	
	
	if health == 1:
		set_visible(false)
		lantern1.visible = true


func set_visible(flag):
	lantern1.visible = flag
	lantern2.visible = flag
	lantern3.visible = flag
