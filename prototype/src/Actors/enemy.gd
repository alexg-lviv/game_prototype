extends Actor

export var speed = 200

var velocity = Vector2()

func _ready() -> void:
	var state_machine = $AnimationTree.get("parameters/playback")
	velocity.x = -speed
	state_machine.travel("run")

func _physics_process(delta: float) -> void:
	if ($RayCast2D.is_colliding() == false) or is_on_wall():
		velocity.x *= -1.0
		$Sprite.scale.x *= -1
		$collision.position.x *= -1
	velocity.y += gravity * delta
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y
