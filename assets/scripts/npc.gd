extends Node2D

var boar: bool
var bee: bool
var snowboar: bool
var me: bool
var me2: bool

func _ready():
	boar = Global.BOAR
	bee = Global.BEE
	snowboar = Global.SNOWBOAR
	me = Global.ME
	me2 = Global.ME2
	
#------------------------------------------------------------#
	if boar == true:
		$boar.queue_free()
	if bee == true:
		$bee.queue_free()
	if snowboar == true:
		$snow_boar.queue_free()
	if me == true:
		$me.queue_free()
	if me2 == true :
		$me2.queue_free()
#------------------------------------------------------------#
	$bee/Label.visible = false

	$boar/booo.visible = false
	$boar/booo2.visible = false

	$snow_boar/snowbo.visible = false

	$me/mee.visible = false
	$me/mee2.visible = false
	$me/mee3.visible = false
	$me/mee4.visible = false

	$me2/t1.visible = false
	$me2/t2.visible = false

func _process(_delta):
	Global.BOAR = boar
	Global.BEE = bee
	Global.SNOWBOAR = snowboar
	Global.ME = me
	Global.ME2 = me2

#----------------------------bee-----------------------------#
func _on_area_2d_body_entered(body):
	if body == Global.player:
		$bee/Label.visible = true
		$bee/bnimation.play("bee-fly")

func _on_bnimation_animation_finished(_anim_name):
	$bee.queue_free()
	bee = true
	Global.save_data()
#----------------------------boar---------------------------#


func _on_boar_area_body_entered(body):
	if body == Global.player:
		$boar/booo.visible = true
		$boar/bonimation.play("1st")

func _on_bonimation_animation_finished(_anim_name):
	$boar/booo.visible = false
	$boar/boar_area.queue_free()
	$boar/booo2.visible = true
	$boar/bonimation2.play("2nd")

func _on_bonimation_2_animation_finished(_anim_name):
	$boar.queue_free()
	boar = true
	Global.save_data()
#--------------------------snow_boar-------------------------#


func _on_booarea_body_entered(body):
	if body == Global.player:
		$snow_boar/snowbo.visible = true
		$snow_boar/snooo.play("snoboar")
	
func _on_snooo_animation_finished(_anim_name):
	$snow_boar.queue_free()
	snowboar = true
	Global.save_data()
#-----------------------------mee-----------------------------#


func _on_mearea_body_entered(body):
	if body == Global.player:
		$me/mee.visible = true
		$me/me.play("1")

func _on_me_animation_finished(_anim_name):
	$me/mee.visible = false
	$me/mearea.queue_free()
	$me/mee2.visible = true
	$me/me2.play("2")

func _on_me_2_animation_finished(_anim_name):
	$me/mee2.visible = false
	$me/mee3.visible= true
	$me/me3.play("3")

func _on_me_3_animation_finished(_anim_name):
	$me/mee3.visible = false
	$me/mee4.visible = true
	$me/me4.play("4")

func _on_me_4_animation_finished(_anim_name):
	$me.queue_free()
	me = true
	Global.save_data()
#----------------------------------------------------------#

func _on_my_body_entered(body):
	if body == Global.player:
		$me2/t1.visible = true
		$me2/tt.play("o")

func _on_tt_animation_finished(_anim_name):
	$me2/t1.visible = false
	$me2/my.queue_free()
	$me2/t2.visible = true
	$me2/tt2.play("oo")

func _on_tt_2_animation_finished(_anim_name):
	$me2.queue_free()
	me2 = true
	Global.save_data()
