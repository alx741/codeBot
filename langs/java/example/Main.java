import codebot.Codebot;
import codebot.Codebot.Axis;
import codebot.Codebot.Direction;

public class Main
{
    public static void main(String args[])
    {
        System.out.println("\n-- Stepping");
        Codebot.step(Direction.FORWARD, Axis.X);
        Codebot.step(Direction.FORWARD, Axis.Y);
        Codebot.step(Direction.BACKWARD, Axis.X);
        Codebot.step(Direction.BACKWARD, Axis.Y);

        System.out.println("\n-- Jumping");
        Codebot.jump(Direction.FORWARD, Axis.X);
        Codebot.jump(Direction.FORWARD, Axis.Y);
        Codebot.jump(Direction.BACKWARD, Axis.X);
        Codebot.jump(Direction.BACKWARD, Axis.Y);

        System.out.println("\n-- Opening Doors");
        Codebot.openDoor(Direction.FORWARD, Axis.X);
        Codebot.openDoor(Direction.FORWARD, Axis.Y);
        Codebot.openDoor(Direction.BACKWARD, Axis.X);
        Codebot.openDoor(Direction.BACKWARD, Axis.Y);

        System.out.println("\n-- Picking up objects");
        Codebot.pickUp();

        System.out.println("\n-- Dropping objects");
        Codebot.drop();

        System.out.println("\n-- Interacting with elements");
        Codebot.interact();
    }
}
