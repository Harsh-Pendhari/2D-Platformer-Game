extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()

func _process(_delta):
	if $ProgressBar.value == 100:
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_timer_timeout():
	$ProgressBar.value += 13
