extends Node2D


func _ready():
	$exit.visible = false
	$buttons/VBoxContainer/controls.visible = false

func _process(_delta):
	if Global.wipe_data == true:
		$buttons/VBoxContainer/continue.visible = false
	else:
		$buttons/VBoxContainer/continue.visible = true

func _on_exit_pressed():
	$buttons/VBoxContainer/exit_btn/exitt.play()
func _on_exitt_finished():
	$exit.visible = true
	$buttons.visible = false
	$title.visible = false
	$studio.visible = false
	$studio2.visible = false
	$game.visible = false
	$game2.visible = false
	$AnimatedSprite2D.visible = false


func _on_no_pressed():
	$exit/no/noo.play()
func _on_noo_finished():
	$exit.visible = false
	$buttons.visible = true
	$title.visible = true
	$studio.visible = true
	$studio2.visible = true
	$game.visible = true
	$game2.visible = true
	$AnimatedSprite2D.visible = true

func _on_yes_pressed():
	$exit/Yes/yess.play()
func _on_yess_finished():
	get_tree().quit()
	get_tree().paused = false
	
func _on_continue_pressed():
	$buttons/VBoxContainer/new/click.play()
	Global.load_data()

func _on_new_pressed():
	Global.wipe()
	$buttons/VBoxContainer/new/click.play()
func _on_click_finished():
	get_tree().change_scene_to_file("res://scenes/loading.tscn")

func _on_credits_pressed():
	$buttons/VBoxContainer/credits/credit.play()
func _on_credit_finished():
	get_tree().change_scene_to_file("res://scenes/credits.tscn")

func _on_controls_pressed():
	$buttons/VBoxContainer/controls/ctrl.play()
func _on_ctrl_finished():
	get_tree().change_scene_to_file("res://scenes/controls.tscn")
