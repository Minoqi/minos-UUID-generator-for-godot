## Code written by Minoqi @2024 under the MIT license
## Documentation: 

@tool
@icon("res://addons/minos_uuid_generator/uuidIcon.svg")
extends Node
class_name UUIDManager

## Variables
var uuid : String = ""


func _enter_tree():
	if uuid == "": # Fail safe
		uuid = MinosUUIDGenerator.generate_new_UUID()


func _exit_tree():
	MinosUUIDGenerator.remove_UUID(uuid)
