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
	add_child(suckable_item)
