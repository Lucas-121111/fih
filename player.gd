extends CharacterBody2D
var leaf_count = 0
@onready var _animated_sprite = $AnimatedSprite2D

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("default")
	else:
		_animated_sprite.play("default")

func _physics_process(delta:float) -> void:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * 400
	move_and_slide()
	
	
	
	
func _on_pickup_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("poster") and not $HeldPoster.visible:
		area.queue_free()
		$HeldPoster.visible = true

	if area.is_in_group("basket") and $HeldPoster.visible:
		$HeldPoster.visible = false
		leaf_count += 1
		$CanvasLayer/CountDisplay.text = "Fish Caught: " + str(leaf_count)
