#include "board.h"
#include <avr/io.h>
#include <util/delay.h>

#define X_CYCLES_DEFAULT 50
#define Y_CYCLES_DEFAULT 100

static int X_CYCLES = X_CYCLES_DEFAULT;
static int Y_CYCLES = Y_CYCLES_DEFAULT;

void x_forward_cycle();
void x_backward_cycle();
void y_forward_cycle();
void y_backward_cycle();
void reset();


void board_init()
{
    DDRC = 0b00001111;
    PORTC = 0x00;
    reset();
}

void reset()
{
    _delay_ms(1000);
    while (PINC & (1 << PINC5))
    {
        x_backward_cycle();
    }

    while (PINC & (1 << PINC4))
    {
        y_backward_cycle();
    }
}

void x_fstep()
{
    for (int i=0; i<X_CYCLES; i++)
    {
        x_forward_cycle();
    }
}

void x_bstep()
{
    for (int i=0; i<X_CYCLES; i++)
    {
        x_backward_cycle();
    }
}

void y_fstep()
{
    for (int i=0; i<Y_CYCLES; i++)
    {
        y_forward_cycle();
    }
}

void y_bstep()
{
    for (int i=0; i<Y_CYCLES; i++)
    {
        x_backward_cycle();
    }
}

void x_forward_cycle()
{
    PORTC |= (1 << PORTC0);
    _delay_us(1500);
    PORTC &= (0 << PORTC0);
    _delay_ms(10);
}

void x_backward_cycle()
{
    PORTC |= (1 << PORTC1);
    _delay_us(1500);
    PORTC &= (0 << PORTC1);
    _delay_ms(10);
}

void y_forward_cycle()
{
    PORTC |= (1 << PORTC2);
    _delay_us(4000);
    PORTC &= (0 << PORTC2);
    _delay_ms(10);
}

void y_backward_cycle()
{
    PORTC |= (1 << PORTC3);
    _delay_us(4000);
    PORTC &= (0 << PORTC3);
    _delay_ms(10);
}
