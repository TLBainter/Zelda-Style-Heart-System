#region DETAILS==============#
class_name HealthComponent
extends Node
#endregion DETAILS==============#

#region SIGNALS==============#
signal healthChanged(cur_hp : int, max_hp : int, chang_amt : int)
#endregion SIGNALS==============#

#region VARIABLES==============#

#region Debug Variables
@export_group("Debug")
@export var debug_me : bool
@export var debug_name : String
#endregion Debug Variables

#region Health Variables
@export_group("Health Settings")
@export var max_hearts : int = 3
var max_health : int = 12
@onready var cur_health : int = max_health:
	set(value):
		var new_health = clampi(value, 0, max_health)
		var chng_amt = new_health - cur_health
		cur_health = new_health
		if chng_amt != 0:
			healthChanged.emit(cur_health, max_health, chng_amt)
#endregion Health Variables
#endregion VARIABLES==============#

#region FUNCTIONS==============#

func _ready():
	#region DEBUG HEALTH NOTIF
	var debug_health_notice : bool = false
	if debug_me:
		#provide instructions for health debugging if they have not yet been given
		if debug_health_notice == false:
			print("You can control the player's health with the num pad.")
			print("Press Numpad Key 8 to recover health,")
			print("and press Numpad Key 2 to lose health.")
			debug_health_notice = true
	#endregion DEBUG HEALTH NOTIF
	
	#region Set Max HP
	#defines the player's max health.
	#since there are 4 hits in a single heart, the player's max health is equal to 4 * their maximum hearts!
	max_health = max_hearts * 4
	if debug_me:
		print("Player Max Health defined as ", max_health, " with ", max_hearts, " hearts.")
	if cur_health != max_health:
		cur_health = max_health
	if debug_me:
		print("Player Current Health is now ", cur_health, ".")
	#endregion Set Max HP

#region Healing
func healed(healing : int):
	self.cur_health += healing
	if debug_me:
		print(debug_name, " gained ", healing, " health.")
		print(debug_name, " now has ", cur_health, " remaining Hit Points.")
#endregion Healing

#region Damaging
func damaged(damage : int):
	self.cur_health -= damage
	if debug_me:
		print(debug_name, " took ", damage, " damage.")
		print(debug_name, " now has ", cur_health, " remaining Hit Points.")
#endregion Damaging

#region Debug
func _unhandled_input(event: InputEvent):
	if debug_me:
		_debug_health(event)
		
func _debug_health(event):
	if debug_me and event.is_action_pressed("hurt_test"):
		print(debug_name, " is being hurt by an input event!")
		damaged(1)
	elif debug_me and event.is_action_pressed("heal_test"):
		print(debug_name, " is being healed by an input event!")
		healed(1)
#endregion Debug

#endregion FUNCTIONS==============#
