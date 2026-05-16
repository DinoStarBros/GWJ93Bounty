extends Projectile
class_name WoodShrapnel

const uh : float = 400

func _ready() -> void:
	%sprite.frame = randi_range(0,4)
	scale.x = randf_range(1, 2)
	scale.y = randf_range(1, 2)
	
	velocity.x = randf_range(-uh, uh)
	velocity.y = randf_range(-uh, uh)
	rotational_velocity = randf_range(-uh, uh)
	
	await get_tree().create_timer(5).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	_move(delta)
	_rotate_vel(delta)
	velocity *= 0.9
	rotational_velocity *= 0.8
