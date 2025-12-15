extends Sprite2D

@export var speed := 400
@export var damage := 25

func _physics_process(delta: float) -> void:
	global_position += Vector2(speed * delta, 0) 


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("hit shark!")
	if body.is_in_group('enemys') and body.has_method('take_damage'):
		body.take_damage(damage)
		queue_free()
