extends Node2D
## The visual of the item when it's in the barrel.
class_name BarrelItem

@onready var sprite: Sprite2D = %sprite

var item_resource : SuckableItemResource
var velocity : Vector2

const lifetime_after : float = 1
const outward_speed : float = 2000

func _ready() -> void:
	sprite.texture = item_resource.texture
	sprite.self_modulate = item_resource.color

func _physics_process(delta: float) -> void:
	global_position += delta * velocity

func shot() -> void:
	velocity.y = -outward_speed
	await get_tree().create_timer(lifetime_after).timeout
	queue_free()

func ejected() -> void:
	velocity.y = outward_speed
	await get_tree().create_timer(lifetime_after).timeout
	queue_free()
