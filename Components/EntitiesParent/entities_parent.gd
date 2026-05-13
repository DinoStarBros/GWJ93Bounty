extends Node2D
class_name EntitiesParent

const dummy_scn : PackedScene = preload("res://Entities/Dummy/dummy.tscn")

func _ready() -> void:
	Global.entities_parent = self
	print(Global.entities_parent)

func spawn_enemy(
	enemy_scn : PackedScene,
	pos : Vector2
) -> void:
	var enemy : Enemy = enemy_scn.instantiate()
	enemy.global_position = pos
	add_child(enemy)

func spawn_dummy(pos: Vector2) -> void:
	spawn_enemy(dummy_scn, pos)
