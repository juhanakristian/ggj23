extends Spatial


onready var area = $Area
signal obstacle_body_entered

onready var green = $Green
onready var purple = $Purple
onready var timer = $Timer

export var delay = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	area.connect("body_entered", self, "_on_body_entered")
	timer.connect("timeout", self, "_on_timer_timeout")

func _process(delta):
	green.rotation_degrees.y += 100 * delta
	purple.rotation_degrees.y += 100 * delta

func _on_body_entered(body):
	emit_signal("obstacle_body_entered")
	if green.visible:
		KantoEventBus.emit_player_collected_item(self, "green_crystal")
		green.visible = false
		timer.start(delay)

	if purple.visible:
		KantoEventBus.emit_player_collected_item(self, "purple_crystal")
		purple.visible = false
		timer.start(delay)

func _on_timer_timeout():
	if randi() % 10 <= 2:
		purple.visible = true
	else:
		green.visible = true
