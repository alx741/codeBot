#include "board.h"
#include <avr/io.h>
#include <util/delay.h>

#define X_MICRO_STEPS 50
#define Y_MICRO_STEPS 50
#define X_WAIT 12
#define Y_WAIT 10

void x_micro_fstep();
void x_micro_bstep();
void y_micro_fstep();
void y_micro_bstep();
void reset();

int X_STATE = 0x01;
int Y_STATE = 0x10;


void board_init()
{
    DDRC = 0b00001111;
    PORTC = 0x00;
    DDRD = 0b01111000;
    PORTD |= 0b00000000;
    reset();
}

void reset()
{
    _delay_ms(1000);
    // Reset X axis
    while (PINC & (1 << PINC5))
    {
        x_micro_bstep();
    }

    // Reset Y axis
    /* y_bstep(); */
    /* while (PINC & (1 << PINC4)) */
    /* { */
    /*     y_micro_bstep(); */
    /* } */
}

void x_fstep()
{
    for (int i=0; i<X_MICRO_STEPS; i++)
    {
        x_micro_fstep();
    }
}

void x_bstep()
{
    for (int i=0; i<X_MICRO_STEPS; i++)
    {
        x_micro_bstep();
    }
}

void y_fstep()
{
    for (int i=0; i<Y_MICRO_STEPS; i++)
    {
        y_micro_fstep();
    }
}

void y_bstep()
{
    for (int i=0; i<Y_MICRO_STEPS; i++)
    {
        y_micro_bstep();
    }
}

void x_micro_fstep()
{
    PORTC = X_STATE;
    _delay_ms(X_WAIT);
    PORTC = 0x00;
    X_STATE = (X_STATE == 0x08)? 0x01 : (X_STATE <<= 1);
}

void x_micro_bstep()
{
    PORTC = X_STATE;
    _delay_ms(X_WAIT);
    PORTC = 0x00;
    X_STATE = (X_STATE == 0x01)? 0x08 : (X_STATE >>= 1);
}

void y_micro_fstep()
{
    PORTD = Y_STATE;
    _delay_ms(Y_WAIT);
    PORTD = 0x00;
    Y_STATE = (Y_STATE == 0x80)? 0x10 : (Y_STATE <<= 1);
}

void y_micro_bstep()
{
    PORTD = Y_STATE;
    _delay_ms(Y_WAIT);
    PORTD = 0x00;
    Y_STATE = (Y_STATE == 0x10)? 0x80 : (Y_STATE >>= 1);
}
