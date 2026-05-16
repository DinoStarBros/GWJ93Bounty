extends Node2D
class_name ArenaWaveComponent

@export var entities_parent : EntitiesParent
@export var waves : Array[WaveResource]

const enemy_spawn_intro_scn : PackedScene = preload("res://Scenes/EnemySpawnIntro/enemy_spawn_intro.tscn")

func _ready() -> void:
	pass
