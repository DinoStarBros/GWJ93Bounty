extends Node2D
class_name ArenaWaveComponent

@export var arena_spawn_domain : CollisionShape2D
@export var entities_parent : EntitiesParent
@export var waves : Array[WaveResource]

const enemy_spawn_intro_scn : PackedScene = preload("res://Scenes/EnemySpawnIntro/enemy_spawn_intro.tscn")

var left_bound : float
var right_bound : float
var up_bound : float
var down_bound : float

@onready var spawn_timer: Timer = %SpawnTimer

func _ready() -> void:
	left_bound = (
		arena_spawn_domain.global_position.x - 
		(arena_spawn_domain.shape.size.x / 2)
	)
	right_bound = (
		arena_spawn_domain.global_position.x + 
		(arena_spawn_domain.shape.size.x / 2)
	)
	up_bound = (
		arena_spawn_domain.global_position.y - 
		(arena_spawn_domain.shape.size.y / 2)
	)
	down_bound = (
		arena_spawn_domain.global_position.y + 
		(arena_spawn_domain.shape.size.y / 2)
	)
	
	spawn_timer.start(get_spawn_time(waves[Global.current_wave-1].spawn_interval_range))
	
	GlobalSignals.NextWaveStart.connect(
		func():
		Global.time_left = waves[Global.current_wave-1].time
	)

func _spawn_enemy() -> void:
	var enemy_spawn_intro : EnemySpawnIntro = enemy_spawn_intro_scn.instantiate()
	enemy_spawn_intro.enemy_type = waves[Global.current_wave-1].enemies.pick_random()
	
	enemy_spawn_intro.global_position.x = (
		randf_range(left_bound, right_bound)
	)
	enemy_spawn_intro.global_position.y = (
		randf_range(up_bound, down_bound)
	)
	
	Global.entities_parent.add_child(enemy_spawn_intro)

func _on_spawn_timer_timeout() -> void:
	spawn_timer.start(get_spawn_time(waves[Global.current_wave-1].spawn_interval_range))
	
	for n in get_spawn_amnt(waves[Global.current_wave-1].spawn_amount_range):
		_spawn_enemy()

func get_spawn_time(si_range: Vector2) -> float:
	return randf_range(si_range.x, si_range.y)

func get_spawn_amnt(sa_range: Vector2i) -> int:
	return randi_range(sa_range.x, sa_range.y)

func _physics_process(delta: float) -> void:
	Global.time_left = max(Global.time_left - delta, 0)
