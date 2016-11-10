import codebot.Codebot;
import codebot.Codebot.Axis;
import codebot.Codebot.Direction;

public class Main
{
    public static void main(String args[])
    {
        System.out.println("\n-- Stepping");
        Codebot.step(Axis.X, Direction.FORWARD);
        Codebot.step(Axis.Y, Direction.FORWARD);
        Codebot.step(Axis.X, Direction.BACKWARD);
        Codebot.step(Axis.Y, Direction.BACKWARD);

        System.out.println("\n-- Jumping");
        Codebot.jump(Axis.X, Direction.FORWARD);
        Codebot.jump(Axis.Y, Direction.FORWARD);
        Codebot.jump(Axis.X, Direction.BACKWARD);
        Codebot.jump(Axis.Y, Direction.BACKWARD);

        System.out.println("\n-- Opening Doors");
        Codebot.openDoor(Axis.X, Direction.FORWARD);
        Codebot.openDoor(Axis.Y, Direction.FORWARD);
        Codebot.openDoor(Axis.X, Direction.BACKWARD);
        Codebot.openDoor(Axis.Y, Direction.BACKWARD);

        System.out.println("\n-- Picking up objects");
        Codebot.pickUp();

        System.out.println("\n-- Dropping objects");
        Codebot.drop();

        System.out.println("\n-- Interacting with elements");
        Codebot.interact();
    }
}
