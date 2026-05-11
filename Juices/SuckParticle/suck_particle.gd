extends Sprite2D
class_name SuckParticle

var velocity : Vector2
var dir : Vector2
var suck_speed : float
var desire_scale : Vector2 = Vector2.ONE
var destination : Vector2
var dist_to_destination : float
var destination_node : SuckEffect

func _ready() -> void:
	scale = Vector2.ZERO

func _physics_process(delta: float) -> void:
	_move(delta)
	
	destination = destination_node.global_position
	
	dir = global_position.direction_to(destination)
	velocity = suck_speed * dir
	
	scale = lerp(scale, desire_scale, 3.0 * delta)
	
	dist_to_destination = global_position.distance_to(destination)

	if dist_to_destination <= 10:
		queue_free()

func _move(delta: float) -> void:
	global_position += delta * velocity
