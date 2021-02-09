extends Actor

export var speed: = 300
export var jump_pover = 250
const FLOOR = Vector2(0, -1)

var velocity = Vector2()
var jumps = 0
var state_machine

func _ready():
	state_machine = $AnimationTree.get("parameters/playback")

func _physics_process(delta: float) -> void:
	if is_on_floor():
		jumps = 0
	var current = state_machine.get_current_node()
	#animation and movement left and right
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
		state_machine.travel("run")
		$Sprite.scale.x = 1
		$collision.position.x = -8
	elif Input.is_action_pressed("move_left"):
		velocity.x = -speed
		state_machine.travel("run")
		$Sprite.scale.x = -1
		$collision.position.x = 8
	else:
		velocity.x = 0
		state_machine.travel("idle")
	
	#jump processig and animation
	if Input.is_action_just_pressed("jump") and (jumps < Global.max_jumps):
		velocity.y = -1 * jump_pover
		jumps += 1
	
	#fight processing and animation
	if Input.is_action_just_pressed("fight"):
		state_machine.travel("fight")
	
	velocity.y += gravity
	
	velocity = move_and_slide(velocity, FLOOR)
