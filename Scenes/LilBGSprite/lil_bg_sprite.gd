extends Projectile
class_name LilBGSprite

func _ready() -> void:
	%sprite.frame = randi_range(0, 5)
	
	await get_tree().create_timer(4).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	velocity.y += 980 * delta
	_move(delta)
