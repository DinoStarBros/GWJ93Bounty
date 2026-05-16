extends VBoxContainer
class_name DevopsStats

@onready var stats_label: Label = %stats_label

var p : Player

func _physics_process(delta: float) -> void:
	if !p: return
	
	stats_label.text = str(
		"hp:", p.health_component.max_hp, 
		"\n",
		"damage mult:", p.damage_mult,
		"\n",
		"suck range", Global.blunderbuss.suck_range,
		"\n",
		"suck spread", Global.blunderbuss.suck_spread,
		"\n",
		"projectile speed", Global.blunderbuss.projectile_spd_mult,
		"\n",
		"move speed", Global.player.move_speed,
		"\n",
		"dash speed", Global.player.dash_speed,
		"\n",
		"barrel capacity", Global.barrel.max_item_amount,
		"\n",
		"projectile size", Global.blunderbuss.projectile_size_mult
	)
