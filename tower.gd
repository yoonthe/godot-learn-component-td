extends StaticBody2D

const BULLET = preload("uid://bgau6yx6pklvy")
@onready var timer: Timer = $Timer
@export var hp:= 500
@onready var health_component: HealthComponent = %HealthComponent
@onready var shape: CollisionShape2D = %CollisionShape2D

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	timer.start()
	health_component.init(hp, shape.shape.get_rect() * shape.transform)
	
func _physics_process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var bullet = BULLET.instantiate()
	add_child(bullet)

func take_damage(damage: int) -> void:
	var is_died = health_component.take_damage(damage)
	if is_died:
		_on_died()

func _on_died() -> void:
	queue_free()
