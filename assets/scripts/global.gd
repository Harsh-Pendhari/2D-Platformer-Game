extends Node

var xPOS = 250
var yPOS = 90
var wipe_data = false
const save_file = "user://savefile.dat"

var BOAR: bool
var BEE: bool
var SNOWBOAR: bool
var ME: bool
var ME2: bool

func _process(_delta):
	if not FileAccess.file_exists(save_file):
		wipe_data = true
	elif FileAccess.file_exists(save_file):
		wipe_data = false

var data = {}

func wipe():
	xPOS = 250
	yPOS = 90
	BOAR = false
	BEE = false
	SNOWBOAR = false
	ME = false
	ME2 = false
	save_data()

func save_data():
	var file = FileAccess.open_encrypted_with_pass(save_file, FileAccess.WRITE, "QwErTyasdfghjklZXCVBNM")
	data = {
		"xPOS" = xPOS,
		"yPOS" = yPOS,
		"BOAR" = BOAR,
		"BEE" = BEE,
		"SNOWBOAR" = SNOWBOAR,
		"ME" = ME,
		"ME2" = ME2,
	}
	file.store_var(data)
	file = null

func load_data():
	if not FileAccess.file_exists(save_file):
		data = {
			"xPOS" = 250,
			"yPOS" = 90,
			"BOAR" = BOAR,
			"BEE" = BEE,
			"SNOWBOAR" = SNOWBOAR,
			"ME" = ME,
			"ME2" = ME2,
		}
		save_data()

	var file = FileAccess.open_encrypted_with_pass(save_file, FileAccess.READ, "QwErTyasdfghjklZXCVBNM")
	data = file.get_var()
	xPOS = data.xPOS
	yPOS = data.yPOS
	BOAR = data.BOAR
	BEE = data.BEE
	SNOWBOAR = data.SNOWBOAR
	ME = data.ME
	ME2 = data.ME2
	file = null

#--------------------------------------------------------------#
var GRAVITY = ProjectSettings.get_setting("physics/2d/default_gravity")

var player 
