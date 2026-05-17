extends Control
class_name TitleScreen

@onready var settings_menu: Settings = %settingsMenu
@onready var how_to_play: HowToPlay = %how_to_play


const lil_bg_sprite_scn : PackedScene = preload("res://Scenes/LilBGSprite/lil_bg_sprite.tscn")

func _ready() -> void:
	get_tree().paused = false
	
	%play.pressed.connect(_play_pressed)
	%tutorial.pressed.connect(_tutorial_pressed)
	%settings.pressed.connect(_settings_pressed)
	%quit.pressed.connect(_quit_pressed)
	%close.pressed.connect(_close_pressed)
	
	settings_menu.hide()
	settings_menu._load()
	
	MusicManager.play_song("title")

func _play_pressed() -> void:
	SceneManager.change_scene("res://Screens/Arena/arena.tscn")

func _tutorial_pressed() -> void:
	how_to_play.show()

func _settings_pressed() -> void:
	settings_menu.show()
	settings_menu._load()

func _quit_pressed() -> void:
	get_tree().quit()

func _close_pressed() -> void:
	# Closes settings menu
	settings_menu._save()
	settings_menu.hide()

func _spawn_lil_bg_sprite() -> void:
	var lil_bg_sprite : LilBGSprite = lil_bg_sprite_scn.instantiate()
	lil_bg_sprite.global_position.y = -200
	lil_bg_sprite.global_position.x = randf_range(0, 1280)
	
	add_child(lil_bg_sprite)


func _on_lil_bg_spawn_timer_timeout() -> void:
	for n in randi_range(1, 3):
		_spawn_lil_bg_sprite()
