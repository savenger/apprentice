extends Node

var Fire = 0
var Ice = 1
var Earth = 2
var Wind = 3

var COUNTER_ELEMENTS = {
	Fire: Ice,
	Ice: Fire,
	Earth: Wind,
	Wind: Earth
}

var ELEMENT_FRAMES = {
	Fire: 3,
	Ice: 2,
	Earth: 2,
	Wind: 2
}
