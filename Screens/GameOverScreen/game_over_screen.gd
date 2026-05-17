extends Control
class_name GameOverScreen

@onready var anim: AnimationPlayer = %anim

func _ready() -> void:
	%retry.pressed.connect(_retry_pressed)
	%exit.pressed.connect(_exit_pressed)

func _retry_pressed() -> void:
	SceneManager.change_scene("res://Screens/Arena/arena.tscn")

func _exit_pressed() -> void:
	SceneManager.change_scene("res://Screens/TitleScreen/title_screen.tscn")
