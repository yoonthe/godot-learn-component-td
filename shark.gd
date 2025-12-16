class_name Shark
extends CharacterBody2D

signal died(point: int)

@export var speed := 200
@export var hp := 100
@export var impact_damage := 50
@export var point := 10
@onready var health_component: HealthComponent = %HealthComponent
@onready var shape: CollisionShape2D = %CollisionShape2D

func _ready() -> void:
	health_component.init(hp, shape.shape.get_rect() * shape.transform)

func _physics_process(delta: float) -> void:
	velocity = Vector2(-speed, 0)
	move_and_slide()
	
	var collision_count = get_slide_collision_count()
	for i in collision_count:
		var collision_info = get_slide_collision(i)
		var collider = collision_info.get_collider()
		if collider.has_method('take_damage'):
			collider.take_damage(impact_damage)
			died.emit(point)
			# TODO: 爆炸效果	
			_on_died()
			return
			

func take_damage(damage: int) -> void:
	var is_died = health_component.take_damage(damage)
	if is_died:
		_on_died()

func _on_died() -> void:
	queue_free()
	
func on_game_over() -> void:
	_on_died()
