extends Node2D
class_name EnemySpawnIntro

var ep : EntitiesParent
var enemy_type : EntitiesParent.EnemyTypes

func _ready() -> void:
	await get_tree().process_frame
	ep = Global.entities_parent
	
	await get_tree().create_timer(1).timeout
	ep.spawn_enemy_enum(enemy_type, global_position)
	queue_free()
	
