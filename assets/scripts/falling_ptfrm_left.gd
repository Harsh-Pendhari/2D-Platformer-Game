extends CharacterBody2D


func _on_area_2d_body_entered(_body):
	$AnimationPlayer.play("shake")

func _on_animation_player_animation_finished(_anim_name):
	transform.origin.x -= 200
	$Timer.start()

func _on_timer_timeout():
	transform.origin.x = 0
