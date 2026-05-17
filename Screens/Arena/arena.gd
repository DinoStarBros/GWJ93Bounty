extends Node2D
class_name Arena

func _ready() -> void:
	Global.enable_devops = false
	MusicManager.play_song("combat")
