extends Node2D

func _ready():
	$CanvasLayer.visible = false
	$control.visible = false
	$CanvasLayer/Button3.visible = false

func _process(_delta):
	if Input.is_action_just_pressed("esc"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		$CanvasLayer.visible = true
		get_tree().paused = true

func _on_button_pressed():
	$CanvasLayer.visible = false
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func _on_button_3_pressed():
	$control.visible = true
	$CanvasLayer.visible = false
	

func _on_back_pressed():
	$control.visible = false
	$CanvasLayer.visible = true


func _on_button_2_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/back_loading.tscn")
