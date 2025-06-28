extends Area2D

signal entered

func _on_body_entered(_body):
	emit_signal("entered")

func _on_body_exited(_body):
	$Timer.start()
