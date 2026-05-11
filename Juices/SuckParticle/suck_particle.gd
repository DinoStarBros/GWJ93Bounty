extends Sprite2D
class_name SuckParticle

var velocity : Vector2
var dir : Vector2
var suck_speed : float
var desire_vel : Vector2
var desire_scale : Vector2 = Vector2.ONE
var destination : Vector2
var dist_to_destination : float

func _ready() -> void:
	desire_vel = suck_speed * dir
	scale = Vector2.ZERO

func _physics_process(delta: float) -> void:
	_move(delta)
	velocity = lerp(velocity, desire_vel, 2.0 * delta)
	scale = lerp(scale, desire_scale, 5.0 * delta)

func _move(delta: float) -> void:
	global_position += delta * velocity
