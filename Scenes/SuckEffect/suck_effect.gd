extends Node2D
class_name SuckEffect

var suck_speed : float = 750
var particle_amnt : int = 2
var enable: bool = false
var suck_range : float = 400
var suck_spread : float = 200

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if enable:
		for n in particle_amnt:
			_spawn_suck_particle()

func _spawn_suck_particle() -> void:
	var suck_particle : SuckParticle = References.suck_particle_scn.instantiate()
	
	suck_particle.suck_speed = suck_speed
	suck_particle.destination = global_position
	suck_particle.destination_node = self
	
	add_child(suck_particle)
	
	suck_particle.position.x = suck_range
	suck_particle.position.y = randf_range(-suck_spread, suck_spread)
