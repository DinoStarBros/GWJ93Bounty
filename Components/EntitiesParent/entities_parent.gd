extends Node2D
class_name EntitiesParent

const dummy_scn : PackedScene = preload("res://Entities/Enemies/Dummy/dummy.tscn")
const deckhand_scn : PackedScene = preload("res://Entities/Enemies/Deckhand/deckhand.tscn")

func _ready() -> void:
	Global.entities_parent = self

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
	spawn_enemy(dummy_scn, pos)
func spawn_parrot(pos: Vector2) -> void:
	spawn_enemy(dummy_scn, pos)
func spawn_crossbower(pos: Vector2) -> void:
	spawn_enemy(dummy_scn, pos)
