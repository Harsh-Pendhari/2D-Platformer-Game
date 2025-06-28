extends AnimatableBody2D


func _ready():
	visible = false

func _on_area_2d_body_entered(_body):
	visible = true

func _on_animationstop_body_entered(_body):
	visible = false
