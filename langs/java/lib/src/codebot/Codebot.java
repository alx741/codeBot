package codebot;

public class Codebot
{
    public static enum Axis { X, Y }
    public static enum Direction { FORWARD, BACKWARD }

    public static void step(Axis axis, Direction direction)
    {
        movement("Step", axis, direction);
    }

    public static void jump(Axis axis, Direction direction)
    {
        movement("Jump", axis, direction);
    }

    public static void openDoor(Axis axis, Direction direction)
    {
        movement("Open Door", axis, direction);
    }

    public static void pickUp()
    {
        System.out.println("Pick Up");
    }

    public static void drop()
    {
        System.out.println("Drop");
    }

    public static void interact()
    {
        System.out.println("Interact");
    }

    private static void movement(String string, Axis axis, Direction direction)
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
