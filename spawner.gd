extends Marker2D

signal shark_died(point: int)

@export var enemy_types: Array[PackedScene]
@export var spawn_interval_min := 2
@export var spawn_interval_max := 4

func _ready() -> void:
	spawn_enemy()

func spawn_enemy() -> void:
	var enemy: Shark = enemy_types.pick_random().instantiate()
	add_child(enemy)
	enemy.died.connect(_on_enemy_died)
	get_tree().create_timer(randf_range(spawn_interval_min, spawn_interval_max)).timeout.connect(spawn_enemy)

func _on_enemy_died(point: int) -> void:
	shark_died.emit(point)
