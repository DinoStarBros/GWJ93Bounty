extends PanelContainer
class_name DialogBox

@onready var dialog_blip: AudioStreamPlayer = %dialog_blip
@onready var dialog_label: Label = %dialog_label

const eury_dialogs : Array[String] = [
	"Hi, what can I do for you? ...
	and no the bird is not for sale.",
	
	
]

var dialog_picked : String
var start_dialog : bool = false

func _ready() -> void:
	dialog_label.visible_characters = 0
	dialog_picked = eury_dialogs.pick_random()
	dialog_label.text = dialog_picked
	await get_tree().create_timer(1).timeout
	start_dialog = true

func _play_dialog_blip() -> void:
	dialog_blip.pitch_scale = 1.5 + randf_range(-.1,.1)
	dialog_blip.play()

func _physics_process(delta: float) -> void:
	pass
	#if start_dialog:
	#	print(dialog_picked.length())

func _on_dialogue_interval_timeout() -> void:
	if start_dialog:
		dialog_label.visible_characters = min(
			dialog_label.visible_characters + 1,
			dialog_picked.length()
		)
		_play_dialog_blip()
		if dialog_label.visible_characters >= dialog_picked.length():
			start_dialog = false
