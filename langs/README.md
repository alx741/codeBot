# Libraries

This is simple: Each language library implements the *Common Interface*
functions/methods which just prints to *stdout* the appropriate strings for the
corresponding actions in a new line each.


# Compiling

Each language contains an example `Makefile` and code. The environment variable
`CODEBOT_LANGPATH` *must* be set to the codebot languages root directory (where
this README file is).


# Common Interface

[Axis] = X | Y

[Direction] = Forward | Backward



- step(axis, direction) ::
    prints: "Step [Axis] [Direction]"

- jump(axis, direction) ::
    prints: "Jump [Axis] [Direction]"

- openDoor(axis, direction) ::
    prints: "OpenDoor [Axis] [Direction]"

- pickUp() ::
    prints: "PickUp"

- drop() ::
    prints: "Drop"

- interact() ::
    prints: "Interact"
