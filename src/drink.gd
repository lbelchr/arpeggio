extends Node

class_name Drink

enum DRINK_TYPE { BLACK_COFFEE, BROWN_COFFEE}

var cost: int
var beans: int
var cups: int 
var cream: int

func _init(drink_type: DRINK_TYPE):
    match drink_type:
        DRINK_TYPE.BLACK_COFFEE:
            cost = 4
            beans = 1
            cups = 1
        DRINK_TYPE.BROWN_COFFEE:
            cost = 4
            beans = 1
            cups = 1
            cream = 1