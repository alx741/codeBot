import axis as axis_
import direction as direction_

def init():
    print("Init")

def step(direction, axis):
    movement("Step", direction, axis)

def jump(direction, axis):
    movement("Jump", direction, axis)

def openDoor(direction, axis):
    movement("openDoor", direction, axis)

def pickUp():
    print("PickUp");

def drop():
    print("Drop");

def interact():
    print("Interact");

def movement(string, direction, axis):
    if (axis == axis_.X):
        if (direction == direction_.FORWARD):
            print(string + " Forward X")
        elif (direction == direction_.BACKWARD):
            print(string + " Backward X")

    elif (axis == axis_.Y):
        if (direction == direction_.FORWARD):
            print(string + " Forward Y")
        elif (direction == direction_.BACKWARD):
            print(string + " Backward Y")
