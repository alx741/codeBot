# Firmware

Build with `make` and flash the AVR328P microcontroller with `make burn`.


## Connection

Serial 9600baud communication.


## Commands

* Every command starts with a `;`.
* Only send a command after the prompt `>` is received.
* Invalid commands are dismissed.
* Commands that force the hardware beyond physical constraints are dismissed.

### Command construction

* Axis commands start with `x` or `y` followed by `:` and then a direction `f`
  or `b`.
* Servo commands start with `s` followed by `:` and then a direction `f` or `b`.
* Reset hardware with `r`.

#### Examples

1 step forward on x axis:

    x:f

Servo 1 step backward:

    s:f
