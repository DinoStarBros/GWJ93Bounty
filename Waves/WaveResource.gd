extends Resource
class_name WaveResource

@export var enemies : Array[EntitiesParent.EnemyTypes] ## Scenes of the enemies that'll be in that wave
@export var time : float = 30.0 ## Seconds
## How many enemies can spawn in one go
## X is min, Y is max
@export var spawn_amount_range : Vector2i = Vector2i(1,1) 
## The time interval between enemies spawning
## X is min, Y is max
@export var spawn_interval_range : Vector2 = Vector2(0.5,1)
