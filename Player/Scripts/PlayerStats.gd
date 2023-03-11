extends Node

@export var max_health = 25 : set = set_max_health
@onready var health = max_health : set = set_health
@export var max_magic = 5 : set = set_max_magic
@onready var magic = max_magic : set = set_magic


signal no_health
signal no_magic
signal health_changed(value)
signal max_health_changed(value)
signal magic_changed(value)
signal max_magic_changed(value)

func _physics_process(_delta: float) -> void:
	health = clamp(health, 0 , max_health)

func set_max_health(value):
	max_health = value
	emit_signal("max_health_changed")
	

func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")

func set_max_magic(value):
	max_magic = value
	emit_signal("max_magic_changed")
	
func set_magic(value):
	magic = value
	emit_signal("magic_changed", magic)
	if health <= 0:
		emit_signal("no_magic")
	




