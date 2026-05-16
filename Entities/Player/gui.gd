extends CanvasLayer
class_name GUI

@onready var coin_count: Label = %coin_count
@onready var wave_count: Label = %wave_count

func _process(delta: float) -> void:
	coin_count.text = str(
		"Coins: ", Global.coins
	)
	
	wave_count.text = str(
		"Wave ", Global.current_wave
	)
