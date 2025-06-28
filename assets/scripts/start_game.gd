extends Node2D

@onready var player:CharacterBody2D = $player

func _ready():
	$ColorRect.visible = false
	Global.player = player

func _process(_delta):
	pass

func _on_game_end_body_entered(_body):
	$ColorRect.visible = true
	$ColorRect/blackscreen.play("pop")

#End_screen
func _on_animation_player_animation_finished(_anim_name):
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	Global.wipe()

#jump sound
func _on_player_jump_pressed():
	$player/jump.play()

#auto_jump sound
func _on_bounce_m_body_entered(body):
	if body == player :
		$player/jump.play()

func _on_bounce_l_body_entered(body):
	if body == player :
		$player/jump.play()

func _on_bounce_s_body_entered(body):
	if body == player :
		$player/jump.play()

func _on_jumpbtn_pressed():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$pause/CanvasLayer.visible = true
	get_tree().paused = true
	print("working")
