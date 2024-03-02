## Code written by Minoqi @2024 under the MIT license
## Documentation: 

@tool
extends Node
class_name MinosUUIDGenerator

## Variables
static var usedUUID : Array[String]
static var possibleCharacters : Array[String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
static var printNewUUID : bool = true
static var printSuccessfulRemoval : bool = true
static var printFailedRemoval : bool = true


## UUID Functions
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
