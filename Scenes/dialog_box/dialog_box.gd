extends PanelContainer
class_name DialogBox

@onready var dialog_blip: AudioStreamPlayer = %dialog_blip
@onready var dialog_label: Label = %dialog_label

const eury_dialogs : Array[String] = [
	"Hi, what can I do for ya? ...
	and no the bird is not for sale.",
	
	"I suggest ya buy something!",
	
	"Oh! What a strong weapon you have.
	If only I sold something to make it
	stronger!",
	
	"Pretty convenient that we keep
	meeting each other huh?",
	
	"Fancy meeting ya here!",
	
	
	
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
	dialog_blip.pitch_scale = 1.0 + randf_range(-.05,.2)
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
