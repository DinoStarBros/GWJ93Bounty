extends Node
class_name SFXManagerClass

@export var sfxs : Array[SFXResource]

const sfx_scn : PackedScene = preload("res://Scenes/SFX/sfx.tscn")
const sfx2d_scn : PackedScene = preload("res://Scenes/SFX2d/sfx_2d.tscn")

func play_sfx() -> void:
	pass

func play_2d_sfx() -> void:
	pass
