import codebot
import axis
import direction

print("\n-- Stepping");
codebot.step(direction.FORWARD, axis.X)
codebot.step(direction.FORWARD, axis.Y)
codebot.step(direction.BACKWARD, axis.X)
codebot.step(direction.BACKWARD, axis.Y)

print("\n-- Jumping");
codebot.jump(direction.FORWARD, axis.X)
codebot.jump(direction.FORWARD, axis.Y)
codebot.jump(direction.BACKWARD, axis.X)
codebot.jump(direction.BACKWARD, axis.Y)

print("\n-- Opening Doors");
codebot.openDoor(direction.FORWARD, axis.X)
codebot.openDoor(direction.FORWARD, axis.Y)
codebot.openDoor(direction.BACKWARD, axis.X)
codebot.openDoor(direction.BACKWARD, axis.Y)

print("\n-- Picking up objects");
codebot.pickUp()

print("\n-- Dropping objects");
codebot.drop()

print("\n-- Interacting with elements");
codebot.interact()
