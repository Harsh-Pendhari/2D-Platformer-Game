extends Node2D

func _ready():
	$Timer.start()

func _process(_delta):
	if $ProgressBar.value == 100:
		get_tree().change_scene_to_file("res://scenes/start_game.tscn")

func _on_timer_timeout():
	$ProgressBar.value += 13
