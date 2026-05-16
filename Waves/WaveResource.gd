extends Resource
class_name WaveResource

@export var enemies : Array[EntitiesParent.EnemyTypes] ## Scenes of the enemies that'll be in that wave
@export var time : float = 30.0 ## Seconds
@export var spawn_amount : int = 1 ## How many enemies can spawn in one go
@export var spawn_interval : float = 0.5 ## The time interval between enemies spawning
