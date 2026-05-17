extends Control
class_name GameOverScreen

@onready var anim: AnimationPlayer = %anim

func _ready() -> void:
	%retry.pressed.connect(_retry_pressed)
	%exit.pressed.connect(_exit_pressed)
	# Bounty Poster art should be 128 * 3 or 384 pixels tall
	
	%bounty_score_count.text = str(
		roundi(Global.bounty_score)
		)

func _retry_pressed() -> void:
	SceneManager.change_scene("res://Screens/Arena/arena.tscn")

func _exit_pressed() -> void:
	SceneManager.change_scene("res://Screens/TitleScreen/title_screen.tscn")
