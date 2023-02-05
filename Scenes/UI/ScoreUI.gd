extends CanvasLayer

onready var score_label = $Control/ScoreLabel
onready var high_score_lable = $Control/HighScoreLabel
onready var health_meter = $Control/HealthMeter

var current_score = 0
var high_score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	KantoEventBus.connect_player_score_updated(self)
	KantoEventBus.connect_reset_game(self)
	KantoEventBus.connect_player_health_updated(self)
	
	
func _on_player_score_updated(score):
	print("Score %s" % score)
	current_score = score 
	score_label.text = str(current_score)
		
func _on_reset_game():
	print("Resetted the game")
	if current_score > high_score:
		high_score = current_score
		high_score_lable.text = str(high_score)
	
	current_score = 0
	score_label.text = str(current_score)
	health_meter.set_health(3)
	

func _on_player_health_updated(health):
	health_meter.set_health(health)

