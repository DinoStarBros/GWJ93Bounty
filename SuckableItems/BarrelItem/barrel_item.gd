extends RigidBody2D
## The visual of the item when it's in the barrel.
class_name BarrelItem

var item_resource : SuckableItemResource

func _ready() -> void:
	linear_velocity.y = 2000
