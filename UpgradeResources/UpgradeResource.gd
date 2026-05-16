extends Resource
class_name UpgradeResource



@export var upgrade_name : String
@export_multiline() var upgrade_desc : String
@export var stat_increase : float = 0
@export var stat_to_upgrade : stats

enum stats {
	MAX_HP,
	DAMAGE,
	PROJECTILE_SPEED,
	PROJECTILE_SIZE,
	SUCK_RANGE,
	MOVE_SPEED,
	DASH_SPEED,
}

func _apply_upgrade_to_player() -> void:
	match stat_to_upgrade:
		stats.MAX_HP:
			
			
		stats.DAMAGE:
			
			
		stats.PROJECTILE_SPEED:
			
			
		stats.PROJECTILE_SIZE:
			
			
		stats.SUCK_RANGE:
			
			
		stats.MOVE_SPEED:
			
			
		stats.DASH_SPEED:
			
			
