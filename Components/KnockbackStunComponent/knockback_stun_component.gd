extends Node2D
## For specific enemy shit like taking knockback and stun when getting hit
class_name KnockbackStunComponent

@export var allow_stun : bool = true
@export var allow_knockback : bool = true
@export var parent : Entity
@export var state_machine : StateMachine

func hurt(attack : Attack) -> void:
	if !state_machine:
		return
	
	if allow_stun:
		state_machine.change_state("Hurt")
	
	if allow_knockback:
		var dir_to_atk : Vector2 = global_position.direction_to(attack.attack_pos)
		parent.velocity = dir_to_atk * attack.knockback
