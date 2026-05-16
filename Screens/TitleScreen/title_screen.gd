extends Control
class_name TitleScreen

@onready var settings_menu: Settings = %settingsMenu

func _ready() -> void:
	%play.pressed.connect(_play_pressed)
	%tutorial.pressed.connect(_tutorial_pressed)
	%settings.pressed.connect(_settings_pressed)
	%quit.pressed.connect(_quit_pressed)
	%close.pressed.connect(_close_pressed)
	
	settings_menu.hide()
	settings_menu._load()

func _play_pressed() -> void:
	pass

func _tutorial_pressed() -> void:
	pass

func _settings_pressed() -> void:
	settings_menu.show()
	settings_menu._load()

func _quit_pressed() -> void:
	get_tree().quit()

func _close_pressed() -> void:
	# Closes settings menu
	settings_menu._save()
	settings_menu.hide()
