extends Button
class_name UpgradeBuyButton

@onready var desc_txt: Label = %desc_txt
@onready var name_txt: Label = %name_txt
@onready var shop : Shop = get_parent().get_parent().get_parent()
@onready var price_txt: Label = %price_txt

var upgrade_resource : UpgradeResource
var bought : bool = false

func _process(delta: float) -> void:
	if !bought:
		name_txt.text = upgrade_resource.upgrade_name
		desc_txt.text = upgrade_resource.upgrade_desc
		price_txt.text = str(
			"Price: ", Global.upgrade_price
			)
	else:
		name_txt.text = bought_name
		desc_txt.text = bought_desc
		price_txt.text = ""

const bought_name : String = "Upgrade Bought"
const bought_desc : String = "Buy other upgrades or restock"

func _ready() -> void:
	pressed.connect(buy)

func buy() -> void:
	if bought: return
	
	if Global.coins >= Global.upgrade_price:
		bought = true
		
		upgrade_resource.apply_upgrade_to_player(upgrade_resource.stat_increase)
		%chaChing.pitch_scale = 1.4 + randf_range(-.1,.1)
		%chaChing.play()
		Global.coins -= Global.upgrade_price
		Global.upgrade_price += 1
