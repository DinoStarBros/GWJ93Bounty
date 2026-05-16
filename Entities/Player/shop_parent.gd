extends CanvasLayer
class_name ShopParent

const shop_scn : PackedScene = preload("res://Panels/Shop/shop.tscn")

func _ready() -> void:
	Global.shop_parent = self
	GlobalSignals.WaveDone.connect(start_shop)

func start_shop() -> void:
	if Global.current_game_state != Global.game_states.COMBAT:
		return
	
	Global.current_game_state = Global.game_states.SHOP
	get_tree().paused = true
	
	var shop : Shop = shop_scn.instantiate()
	add_child(shop)
