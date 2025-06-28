extends CharacterBody2D

var gravity = 5

func _on_entered_body_entered(_body):
	$AnimationPlayer.play("shake")

func _on_animation_player_animation_finished(_anim_name):
	transform.origin.y += 5000
	$Timer.start()
	on_floor = true

var on_floor = false

func _on_timer_timeout():
	on_floor = false

func _process(delta):
	if on_floor == true : 
		velocity.y += gravity * delta
	elif on_floor == false:
		transform.origin.y = 0
