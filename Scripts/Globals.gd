extends Node

enum ELEMENTS {
	Fire, Ice, Earth, Wind
}

var COUNTER_ELEMENTS = {
	ELEMENTS.Fire: ELEMENTS.Ice,
	ELEMENTS.Ice: ELEMENTS.Fire,
	ELEMENTS.Earth: ELEMENTS.Wind,
	ELEMENTS.Wind: ELEMENTS.Earth
}
