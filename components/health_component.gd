class_name HealthComponent
extends Node2D

@onready var health_bar: ProgressBar = %ProgressBar
var hp = 100

func init(init_hp: int, rect: Rect2) -> void:
	hp = init_hp
	health_bar.max_value = hp
	health_bar.value = hp
	_set_pos(rect)

func _set_pos(rect: Rect2) -> void:
	health_bar.size.x = rect.size.x
	health_bar.position = rect.position + Vector2(0, -32)


func take_damage(damage: int) -> bool:
	hp -= damage
	health_bar.value = hp
	if hp <= 0:
		queue_free()
		return true
	return false
