extends Area2D

@export var damage = 5

func _on_Hurtbox_area_shape_entered(_area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	PlayerStats.health -= damage
	$InvincibilityTimer.start()
	$CollisionShape2D.disabled = true

func _physics_process(delta: float) -> void:
	if $InvincibilityTimer.is_stopped():
		$CollisionShape2D.disabled = false 

	
