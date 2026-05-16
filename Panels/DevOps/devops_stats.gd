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
		
	)
