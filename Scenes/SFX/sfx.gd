extends AudioStreamPlayer
class_name SFX

var start_point : float

func _ready() -> void:
	play(start_point)
	finished.connect(
		func():
		queue_free()
		)
