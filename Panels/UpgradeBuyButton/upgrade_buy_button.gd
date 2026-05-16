extends Button
class_name UpgradeBuyButton

@onready var desc_txt: Label = %desc_txt
@onready var name_txt: Label = %name_txt

var upgrade_resource : UpgradeResource
var bought : bool = false

func _process(delta: float) -> void:
		if !bought:
			name_txt.text = upgrade_resource.upgrade_name
			desc_txt.text = upgrade_resource.upgrade_desc
		else:
			name_txt.text = bought_name
			desc_txt.text = bought_desc

const bought_name : String = "Upgrade Bought"
const bought_desc : String = "Buy other upgrades or restock"

func _ready() -> void:
	pressed.connect(buy)
	
	await get_tree().process_frame
	name_txt.text = upgrade_resource.upgrade_name
	desc_txt.text = upgrade_resource.upgrade_desc

func buy() -> void:
	if bought: return
	
	bought = true
	name_txt.text = bought_name
	desc_txt.text = bought_desc
	
	upgrade_resource.apply_upgrade_to_player(upgrade_resource.stat_increase)
	%chaChing.pitch_scale = 1.4 + randf_range(-.1,.1)
	%chaChing.play()
