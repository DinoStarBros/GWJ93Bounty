extends Projectile
class_name SupplyCrate

var is_go_to_suck : bool = false
var dir_to_plr : Vector2

const move_speed : float = 700

func _physics_process(delta: float) -> void:
	dir_to_plr = global_position.direction_to(Global.player.global_position + Vector2(0, -32))
	
	if is_go_to_suck:
		velocity = dir_to_plr * move_speed
	else:
		velocity *= 0.8
	
	_move(delta)

func _on_suck_area_area_entered(area: Area2D) -> void:
	is_go_to_suck = true

func _on_suck_area_area_exited(area: Area2D) -> void:
	is_go_to_suck = false
