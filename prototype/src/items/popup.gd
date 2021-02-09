extends Popup


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _ready():
	$"/root/Global".register_popup(self)

# Called when the node enters the scene tree for the first time.
func view_popup():
	popup()
