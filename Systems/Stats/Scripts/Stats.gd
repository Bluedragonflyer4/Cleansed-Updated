extends Node

@export var max_health = 5 : set = set_max_health
@onready var health = max_health : set = set_health


signal no_health
signal health_changed(value)
signal max_health_changed(value)


func set_max_health(value):
	max_health = value
	emit_signal("max_health_changed")

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")
