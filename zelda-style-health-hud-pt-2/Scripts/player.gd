#region DETAILS==============#
class_name Player
extends Node2D
#region DETAILS==============#

#region VARIABLES==============#
@export_group("Debug")
@export var debug_me : bool = false
@export var debug_name : String = "Player UX"
@export_group("Player Components")
@export var health : HealthComponent
#endregion VARIABLES==============#
