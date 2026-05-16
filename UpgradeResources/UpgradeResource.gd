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

func apply_upgrade_to_player(increase: float) -> void:
	match stat_to_upgrade:
		stats.MAX_HP:
			Global.player.health_component.max_hp += increase
			Global.player.health_component.hp += increase
			
		stats.DAMAGE:
			Global.player.damage_mult += increase
			
		stats.PROJECTILE_SPEED:
			Global.player
			
		stats.PROJECTILE_SIZE:
			Global.player
			
		stats.SUCK_RANGE:
			Global.player
			
		stats.MOVE_SPEED:
			Global.player
			
		stats.DASH_SPEED:
			Global.player
			
