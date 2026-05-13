extends Node2D
class_name ItemsParent

const suckable_item_scn : PackedScene = preload("res://SuckableItems/SuckableItem/suckable_item.tscn")

func _ready() -> void:
	Global.items_parent = self

func spawn_item(
	item_resource: SuckableItemResource,
	pos : Vector2
) -> void:
	
	var suckable_item : SuckableItem = suckable_item_scn.instantiate()
	suckable_item.global_position = pos
	suckable_item.item_resource = item_resource
	add_child(suckable_item)

func spawn_coin(pos: Vector2) -> void:
	spawn_item(preload("res://SuckableItems/SuckableItemResources/coin.tres"), pos)
func spawn_grapeshot(pos: Vector2) -> void:
	spawn_item(preload("res://SuckableItems/SuckableItemResources/grapeshot.tres"), pos)
func spawn_heavyball(pos: Vector2) -> void:
	spawn_item(preload("res://SuckableItems/SuckableItemResources/heavyBall.tres"), pos)
func spawn_nail(pos: Vector2) -> void:
	spawn_item(preload("res://SuckableItems/SuckableItemResources/nail.tres"), pos)
func spawn_buckshot(pos: Vector2) -> void:
	spawn_item(preload("res://SuckableItems/SuckableItemResources/buckshot.tres"), pos)
func spawn_rubberball(pos: Vector2) -> void:
	spawn_item(preload("res://SuckableItems/SuckableItemResources/rubberBall.tres"), pos)
