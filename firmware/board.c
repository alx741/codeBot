#include "board.h"
#include <avr/io.h>
#include <util/delay.h>

#define X_CICLES 50
#define Y_CICLES 100

void board_init()
{
    DDRD = 0xFF;
    PORTD = 0x00;
}

void x_fstep()
{
    for (int i=0; i<X_CICLES; i++)
    {
        PORTD |= (1 << PORTD0);
        _delay_us(1500);
        PORTD &= (0 << PORTD0);
        _delay_ms(15);
    }
}

void x_bstep()
{
    for (int i=0; i<X_CICLES; i++)
    {
        PORTD |= (1 << PORTD1);
        _delay_us(1500);
        PORTD &= (0 << PORTD1);
        _delay_ms(15);
    }
}

void y_fstep()
{
    for (int i=0; i<Y_CICLES; i++)
    {
        PORTD |= (1 << PORTD2);
        _delay_us(4000);
        PORTD &= (0 << PORTD2);
        _delay_ms(10);
    }
}

void y_bstep()
{
    for (int i=0; i<Y_CICLES; i++)
    {
        PORTD |= (1 << PORTD3);
        _delay_us(4000);
        PORTD &= (0 << PORTD3);
        _delay_ms(10);
    }
}
