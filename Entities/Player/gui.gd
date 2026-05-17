extends CanvasLayer
class_name GUI

@onready var coin_count: Label = %coin_count
@onready var wave_count: Label = %wave_count
@onready var time_left_text: Label = %time_left_text
@onready var bounty_score_count: Label = %bounty_score_count

var lerped_bscore : float

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	coin_count.text = str(
		"Coins: ", Global.coins
	)
	
	wave_count.text = str(
		"Wave ", Global.current_wave
	)
	
	time_left_text.text = str(
		roundi(Global.time_left)
	)
	
	bounty_score_count.text = str(
		"Bounty Score: ", roundi(lerped_bscore)
	)
	
	lerped_bscore = lerp(lerped_bscore, Global.bounty_score, 4.0*delta)
