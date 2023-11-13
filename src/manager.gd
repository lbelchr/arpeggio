extends Node

enum DIRECTION { LEFT, RIGHT, UP, DOWN }

# sim speed
var sim_speed: int = 200

# calendar
var current_day: int

# resources
var money: int
var beans: int
var cups: int
var cream: int

# day supplies
var cost_supply: int
var beans_supply: int
var cups_supply: int
var cream_supply: int

# daily stats
var revenue_day: int
var beans_day: int
var cups_day: int
var cream_day: int

# all-time stats
var revenue: int
var beans_all: int
var cups_all: int
var cream_all: int

func _buy_supplies():
    money -= cost_supply
    beans += beans_supply
    cups += cups_supply
    cream += cream_supply

func _reset_day():
    revenue_day = 0
    beans_day = 0
    cups_day = 0
    cream_day = 0

func _next_day():
    current_day += 1

func _process_order(drink_order: Drink):
    # track the day stats
    revenue_day += drink_order.cost
    beans_day += drink_order.beans
    cups_day += drink_order.cups
    cream_day += drink_order.cream

    # track all-time stats
    revenue += drink_order.cost
    beans_all += drink_order.beans
    cups_all += drink_order.cups
    cream_all += drink_order.cream

    # update current supplies
    money += drink_order.cost
    beans -= drink_order.beans
    cups -= drink_order.cups
    cream -= drink_order.cream