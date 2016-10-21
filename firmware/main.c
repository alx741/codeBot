#include <avr/io.h>
#include "uart.h"
#include "servo.h"
#include "board.h"

#define F_CPU 16000000

int main(void)
{
    uart_init();
    servo_init();
    board_init();
    x_fstep();
    y_fstep();
}
