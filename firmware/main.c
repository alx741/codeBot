#include <avr/io.h>
#include <util/delay.h>
#include "uart.h"
#include "servo.h"
#include "board.h"

#define F_CPU 16000000

int main(void)
{
    board_init();
    uart_init();
    servo_init();
    puts("\ndone!\n");
}
