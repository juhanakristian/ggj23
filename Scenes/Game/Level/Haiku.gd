extends Control

onready var label = $Haiku


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var haikus = [
	"Axe cleaves the trunk's heart\nLifeblood spills out on the ground\nSilent death echoes.",
	"Once proud, steadfast tree\nNow stands, leaves rustling weak\nDeath whispers its name.",
	"Splitting trunk echoes,\nWooden groan, then silence reigns.\nNew life begins now.",
	"Tree trunk splits apart\nWood creaks, falls to the ground\nNature takes its course."
]

# Called when the node enters the scene tree for the first time.
func _ready():
	_randomize_haiku()
	KantoEventBus.connect_player_death(self, "_randomize_haiku")


func _randomize_haiku():
	var index = randi() % haikus.size()
	label.text = haikus[index]
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	KantoEventBus.emit_reset_game()
	#KantoSceneLoader.load_scene(self, "res://Scenes/Game/Level/EnvTestLevel.tscn")
