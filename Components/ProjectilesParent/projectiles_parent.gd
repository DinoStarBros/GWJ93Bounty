extends Node2D
## For the level scene
## to store the projectiles
class_name ProjectilesParent


func _ready() -> void:
	Global.projectiles_parent = self
