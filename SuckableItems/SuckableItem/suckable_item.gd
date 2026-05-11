extends Node2D
## Parent class for suckable items
class_name SuckableItem

@export var item_resource : SuckableItemResource

@onready var sprite: Sprite2D = %Sprite

func _ready() -> void:
	sprite.texture = item_resource.texture
