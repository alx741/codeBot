#include <avr/io.h>
#include <util/delay.h>

#define F_CPU 16000000
#define X_CICLES 50
#define Y_CICLES 100

void x_fstep();
void y_fstep();
void x_bstep();
void y_bstep();


int main(void)
{
    DDRB = 0xFF;
    PORTB = 0x00;
    /* x_fstep(); */
    /* y_fstep(); */
}

void x_fstep()
{
    for (int i=0; i<X_CICLES; i++)
    {
        PORTB |= (1 << PORTB0);
        _delay_us(1500);
        PORTB &= (0 << PORTB0);
        _delay_ms(15);
    }
}

void x_bstep()
{
    for (int i=0; i<X_CICLES; i++)
    {
        PORTB |= (1 << PORTB1);
        _delay_us(1500);
        PORTB &= (0 << PORTB1);
        _delay_ms(15);
    }
}

void y_fstep()
{
    for (int i=0; i<Y_CICLES; i++)
    {
        PORTB |= (1 << PORTB2);
        _delay_us(4000);
        PORTB &= (0 << PORTB2);
        _delay_ms(10);
    }
}

void y_bstep()
{
    for (int i=0; i<Y_CICLES; i++)
    {
        PORTB |= (1 << PORTB3);
        _delay_us(4000);
        PORTB &= (0 << PORTB3);
        _delay_ms(10);
    }
}
