extends CharacterBody2D

signal jump_pressed

const SPEED = 300.0
const jump_velocity = -400.0

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
var animation_locked : bool = false
var direction : Vector2 = Vector2.ZERO
var was_in_air : bool = false
var gravity = Global.GRAVITY

func _ready():
	#Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
	position.x = Global.xPOS
	position.y = Global.yPOS

func _process(_delta):
	Global.xPOS = position.x
	Global.yPOS = position.y

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		was_in_air = true
	else:
		if was_in_air == true:
			land() 
		was_in_air = false

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity
		jump()

	if Input.is_action_just_pressed("ui_accept"):
		emit_signal("jump_pressed")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction.x != 0 && animated_sprite.animation != "jump_end":
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	update_animation()
	update_facing_direction()

func update_animation():
	if not animation_locked :
		if not is_on_floor():
			animated_sprite.play("jump_loop")
		else:
			if direction.x != 0:
				animated_sprite.play("run")
			else:
				animated_sprite.play("idle")

func update_facing_direction():
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true

func jump():
	
	animated_sprite.play("jump_start")
	animation_locked = true
	
func land():
	animated_sprite.play("jump_end")
	animation_locked = true


func _on_animated_sprite_2d_animation_finished():
	if animated_sprite.animation == "jump_end":
		animation_locked = false


#--------------------saving------------------#

func _on_timer_timeout():
	Global.save_data()


#--------------------sapce_gravity-------------------#

func _on_area_2d_body_entered(_body):
	gravity = 250

func _on_normalgravity_body_entered(_body):
	gravity = Global.GRAVITY


#---------------bounce-----------#

func _on_bounce_m_body_entered(_body):
	velocity.y = gravity * -0.5

func _on_bounce_l_body_entered(_body):
	velocity.y = gravity * -0.5

func _on_bounce_s_body_entered(_body):
	velocity.y = gravity * -0.5


func _on_check_box_toggled(button_pressed: bool) -> void:
	if button_pressed :
		$background_music.play()
	else:
		$background_music.stop()

#left movement
