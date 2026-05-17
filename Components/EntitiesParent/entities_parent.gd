extends Node2D
class_name EntitiesParent

enum EnemyTypes {
	DUMMY, DECKHAND, BUCCANEER,
	PARROT, CROSSBOWER, FLAMER
}

const dummy_scn : PackedScene = preload("res://Entities/Enemies/Dummy/dummy.tscn")
const deckhand_scn : PackedScene = preload("res://Entities/Enemies/Deckhand/deckhand.tscn")
const buccaneer_scn : PackedScene = preload("res://Entities/Enemies/Buccaneer/buccaneer.tscn")
const parrot_scn : PackedScene = preload("res://Entities/Enemies/Parrot/parrot.tscn")
const crossbower_scn : PackedScene = preload("res://Entities/Enemies/Crossbower/crossbower.tscn")
const flamer_scn : PackedScene = preload("res://Entities/Enemies/Flamer/flamer.tscn")

func _ready() -> void:
	Global.entities_parent = self
	GlobalSignals.WaveDone.connect(clear_all_enemies)

func spawn_enemy(
	enemy_scn : PackedScene,
	pos : Vector2
) -> void:
	var enemy : Enemy = enemy_scn.instantiate()
	enemy.global_position = pos
	add_child(enemy)

func spawn_dummy(pos: Vector2) -> void:
	spawn_enemy(dummy_scn, pos)
func spawn_deckhand(pos: Vector2) -> void:
	spawn_enemy(deckhand_scn, pos)
func spawn_buccaneer(pos: Vector2) -> void:
	spawn_enemy(buccaneer_scn, pos)
func spawn_parrot(pos: Vector2) -> void:
	spawn_enemy(parrot_scn, pos)
func spawn_crossbower(pos: Vector2) -> void:
	spawn_enemy(crossbower_scn, pos)
func spawn_flamer(pos: Vector2) -> void:
	spawn_enemy(flamer_scn, pos)

func spawn_enemy_enum(
	enemy_type : EnemyTypes,
	pos : Vector2
) -> void:
	match enemy_type:
		EnemyTypes.DUMMY:
			spawn_dummy(pos)
		EnemyTypes.DECKHAND:
			spawn_deckhand(pos)
		EnemyTypes.BUCCANEER:
			spawn_buccaneer(pos)
		EnemyTypes.PARROT:
			spawn_parrot(pos)
		EnemyTypes.CROSSBOWER:
			spawn_crossbower(pos)
		EnemyTypes.FLAMER:
			spawn_flamer(pos)

func clear_all_enemies() -> void:
	for entity in get_children():
		if entity is Enemy:
			entity.queue_free()
