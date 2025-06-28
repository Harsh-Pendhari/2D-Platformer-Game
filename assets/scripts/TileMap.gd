extends TileMap

func _ready():
	visible = true

func _on_area_2d_entered():
	visible = false

func _on_timer_timeout():
	visible = true
