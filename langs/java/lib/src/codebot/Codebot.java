package codebot;

public class Codebot
{
    public static enum Direction { FORWARD, BACKWARD }
    public static enum Axis { X, Y }

    public static void init()
    {
        System.out.println("Init");
    }

    public static void step(Direction direction, Axis axis)
    {
        movement("Step", direction, axis);
    }

    public static void jump(Direction direction, Axis axis)
    {
        movement("Jump", direction, axis);
    }

    public static void openDoor(Direction direction, Axis axis)
    {
        movement("OpenDoor", direction, axis);
    }

    public static void pickUp()
    {
        System.out.println("PickUp");
    }

    public static void drop()
    {
        System.out.println("Drop");
    }

    public static void interact()
    {
        System.out.println("Interact");
    }

    private static void movement(String string, Direction direction, Axis axis)
    {
        if (axis == Axis.X)
        {
            switch (direction)
            {
                case FORWARD:
                    System.out.println(string + " Forward X");
                    break;

                case BACKWARD:
                    System.out.println(string + " Backward X");
                    break;
            }
        }
        else if (axis == Axis.Y)
        {
            switch (direction)
            {
                case FORWARD:
                    System.out.println(string + " Forward Y");
                    break;

                case BACKWARD:
                    System.out.println(string + " Backward Y");
                    break;
            }
        }
    }
}
