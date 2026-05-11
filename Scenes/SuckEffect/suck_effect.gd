extends Node2D
class_name SuckEffect

@onready var suck_particle_start_x: Marker2D = %SuckParticleStartX

var rot : float
var suck_speed : float = 1500

const suck_range : float = 175
const suck_circ : float = PI/6 ## suck_circumference

func _process(delta: float) -> void:
	for n in 2:
		_spawn_suck_particle()
	rot = owner.get_parent().rotation

func _spawn_suck_particle() -> void:
	var suck_particle : SuckParticle = References.juices["suck_particle"].instantiate()
	var randrot : float = rot + randf_range(-suck_circ, suck_circ)
	
	suck_particle.suck_speed = suck_speed
	suck_particle.dir.x = -cos(randrot)
	suck_particle.dir.y = -sin(randrot)
	
	Global.projectiles_parent.add_child(suck_particle)
	
	suck_particle.global_position = Vector2(
		cos(randrot), sin(randrot)
	) * suck_range + global_position
