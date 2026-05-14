extends Node2D
## For specific enemy shit like taking knockback and stun when getting hit
class_name KnockbackStunComponent

@export var allow_stun : bool = true
@export var allow_knockback : bool = true
@export var parent : Entity
@export var state_machine : StateMachine

var dir_to_atk : Vector2

func hurt(attack : Attack) -> void:
	if !state_machine:
		return
	
	if allow_stun:
		state_machine.change_state("Hurt")
		state_machine.find_child("Hurt").state_duration = attack.stun_duration
		# EXCUSE ME BUT WHY THE FUCK IS THIS CODE HERE
		# YOU FUCKING DUMBASS
		# Says the singular programmer on this project
		# IM FUCKING TWEAKING MAANNN
	
	if allow_knockback:
		if parent is Enemy:
			dir_to_atk = global_position.direction_to(Global.player.global_position)
		else:
			dir_to_atk = global_position.direction_to(attack.attack_pos)
		parent.velocity = -dir_to_atk * attack.knockback
