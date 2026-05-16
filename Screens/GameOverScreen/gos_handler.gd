extends Node
class_name GameOverScreenHandler

@onready var anim: AnimationPlayer = %anim

const intro_delay : float = 1.5

func _ready() -> void:
	intro_handle(intro_delay)
	visual_handle()

func intro_handle(delay : float) -> void:
	await get_tree().create_timer(delay).timeout
	anim.play("intro")

func visual_handle() -> void:
	match Global.current_game_state:
		Global.game_states.LOSE:
			%txt.text = str(
				"Your Bounty Has Been
				Claimed!"
			)
			# Show lost bounty poster
		Global.game_states.WIN:
			%txt.text = str(
				"Pirate Menace Still
				On the Loose!"
			)
			# Show winning bounty poster
		_:
			assert(false, "Bruh how tf you here")
