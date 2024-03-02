extends Node2D

## Variables
@export var uuidNode : UUIDManager


# Called when the node enters the scene tree for the first time.
func _ready():
	uuidNode = MinosUUIDGenerator.create_new_uuid(self)
