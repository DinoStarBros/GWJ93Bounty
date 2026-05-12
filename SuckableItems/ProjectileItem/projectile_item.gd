extends Projectile
class_name ProjectileItem

@onready var sprite: Sprite2D = %Sprite2D

var item_resource : SuckableItemResource

func _ready() -> void:
	sprite.texture = item_resource.texture
	sprite.self_modulate = item_resource.color
	%LifeTimer.timeout.connect(
		func():
			queue_free()
	)

func _physics_process(delta: float) -> void:
	_move(delta)
