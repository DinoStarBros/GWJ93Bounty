extends Node2D
class_name BlunderbussPivot

@onready var blunderbuss: Blunderbuss = %Blunderbuss

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	_blunder_sprite_flip_handle()

func _blunder_sprite_flip_handle() -> void:
	rotation = wrapf(rotation, 0, 2 * PI)
	blunderbuss.sprite.flip_v = cos(rotation) < 0
