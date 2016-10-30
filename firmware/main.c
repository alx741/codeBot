#include <avr/io.h>
#include <util/delay.h>
#include "uart.h"
#include "servo.h"
#include "board.h"

#define F_CPU 16000000

void init(void)
{
    board_init();
    servo_init();
    uart_init();
}

int main(void)
{
}
