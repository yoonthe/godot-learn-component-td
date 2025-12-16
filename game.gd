extends Node2D

@onready var score_label: Label = %ScoreLabel
@onready var fish_through_label: Label = %FishThroughLabel
@onready var game_over_label: Label = %GameOverLabel
@export var max_units_through := 1
var points := 0

func _ready() -> void:
	fish_through_label.text = str('Shark through: ', max_units_through)

func _on_detector_body_entered(body: Node2D) -> void:
	max_units_through -= 1
	fish_through_label.text = str('Shark through: ', max_units_through)
	
	if max_units_through <= 0:
		game_over_label.visible = true
		propagate_call("on_game_over")
		#for node in get_tree().get_nodes_in_group('need_destroy_entities'):
			#node.queue_free()
	
func _on_update_point(point: int) -> void:
	points += point
	score_label.text = str('Score: ', points)
