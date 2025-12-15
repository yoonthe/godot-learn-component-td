extends Node2D

@onready var score_label: Label = %ScoreLabel
@onready var fish_through_label: Label = %FishThroughLabel
@export var max_units_through := 10
var points := 0

func _ready() -> void:
	fish_through_label.text = str('Shark through: ', max_units_through)

func _on_detector_body_entered(body: Node2D) -> void:
	max_units_through -= 1
	fish_through_label.text = str('Shark through: ', max_units_through)
	
func _on_update_point(point: int) -> void:
	points += point
	score_label.text = str('Score: ', points)
