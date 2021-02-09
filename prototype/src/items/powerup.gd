extends Area2D

onready var state_machine = $AnimationTree.get("parameters/playback")
onready var state_machine2 = $Polygon2D/AnimationTree2.get("parameters/playback")

func _physics_process(delta: float) -> void:
	if (is_in == true) and Input.is_action_pressed("pick_up"):
		state_machine.travel("expire")
		state_machine2.travel("to_invisible")
		$".".queue_free()
		Global.max_jumps += 1
	pass
	
func _ready():
	pass
var is_in = false

func _on_body_entered(body: PhysicsBody2D) -> void:
	state_machine2.travel("to_visible")
	is_in = true

func _on_body_exited(body: PhysicsBody2D):
	state_machine2.travel("to_invisible")
	is_in = false


func _on_tree_entered():
	pass # Replace with function body.
