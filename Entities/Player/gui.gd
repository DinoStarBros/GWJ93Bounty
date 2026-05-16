extends CanvasLayer
class_name GUI

@onready var coin_count: Label = %coin_count

func _process(delta: float) -> void:
	coin_count.text = str(
		"Coins: ", Global.coins
	)
