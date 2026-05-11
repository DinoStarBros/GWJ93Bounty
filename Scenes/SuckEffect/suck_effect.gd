extends Node2D
class_name SuckEffect

@onready var suck_particle_start_x: Marker2D = %SuckParticleStartX

func _physics_process(delta: float) -> void:
	pass

func _spawn_suck_particle() -> void:
	var suck_particle : SuckParticle = References.juices["suck_particle"].instantiate()
	
