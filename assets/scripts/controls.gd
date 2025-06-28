extends Node2D


func _on_button_pressed():
	$click.play()


func _on_click_finished():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
