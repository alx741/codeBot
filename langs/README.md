# Libraries

This is simple: Each language library implements the *Common Interface*
functions/methods which just prints to *stdout* the appropriate strings for the
corresponding actions in a new line each.


# Common Interface

[Axis] = X | Y

[Direction] = Forward | Backward



- step(axis, direction) ::
    prints: "Step [Axis] [Direction]"

- jump(axis, direction) ::
    prints: "Jump [Axis] [Direction]"

- openDoor(axis, direction) ::
    prints: "Open Door [Axis] [Direction]"

- pickUp() ::
    prints: "Pick Up"

- drop() ::
    prints: "Drop"

- interact() ::
    prints: "Interact"
