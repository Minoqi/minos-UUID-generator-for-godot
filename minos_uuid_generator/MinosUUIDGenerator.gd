## Code written by Minoqi @2024 under the MIT license
## Documentation: https://github.com/Minoqi/minos-UUID-generator-for-godot

@tool
extends Node
class_name MinosUUIDGenerator

## Variables
static var uuidManagerNode = preload("res://addons/minos_uuid_generator/UUIDManager.gd")
static var usedUUID : Array[String]
static var possibleCharacters : Array[String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

# Debugging
static var printNewUUID : bool = true
static var printSuccessfulRemoval : bool = true
static var printFailedRemoval : bool = true
static var printNewUUIDNode : bool = true


## Generate UUID
static func generate_new_UUID() -> String:
	# Variables
	var firstUUIDSection : String
	var secondUUIDSection : String
	var thirdUUIDSection : String
	var fourthUUIDSection : String
	var finalUUID : String
	var uuidExists : bool = true

	# Generate new UUID
	while uuidExists:
		# Generate parts
		for i in range(0, 8): # First section
			firstUUIDSection += possibleCharacters.pick_random()
		
		for i in range(0, 4): # Second section
			secondUUIDSection += possibleCharacters.pick_random()
		
		for i in range(0, 4): # Third section
			thirdUUIDSection += possibleCharacters.pick_random()
		
		for i in range(0, 12): # Fourth section
			fourthUUIDSection += possibleCharacters.pick_random()
		
		# Put together and check if exists
		finalUUID = firstUUIDSection + "-" + secondUUIDSection + "-" + thirdUUIDSection + "-" + fourthUUIDSection
		
		if usedUUID.has(finalUUID):
			uuidExists = true
		else:
			uuidExists = false
	
	# Store UUID as used
	usedUUID.append(finalUUID)
	
	if printNewUUID:
		print("NEW UUID GENERATED: ", finalUUID)
	
	return finalUUID


static func remove_UUID(_uuid : String) -> void:
	if usedUUID.has(_uuid):
		usedUUID.erase(_uuid)
		
		if printSuccessfulRemoval:
			print("UUID REMOVED: ", _uuid)
	else:
		if printFailedRemoval:
			printerr("ATTEMPTED TO REMOVE UUID BUT UUID NOT FOUND")


## Create UUID at runtime
static func create_new_uuid(_parentNode : Node) -> Node:
	var uuidNode = uuidManagerNode.new()
	_parentNode.add_child(uuidNode)
	
	if printNewUUIDNode:
		print("NEW UUID NODE MADE")
	
	return uuidNode
