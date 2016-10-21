#include "servo.h"
#include <avr/io.h>

#define SERVO_180 560
#define SERVO_90 345
#define SERVO_0 140
#define SERVO_STEP 50

#define SERVO_ANGLE_START 250
#define SERVO_ANGLE_END 400


void servo_init()
{
    TCCR1A|=(1<<COM1A1)|(1<<COM1B1)|(1<<WGM11); // NON Inverted PWM
    TCCR1B|=(1<<WGM13)|(1<<WGM12)|(1<<CS11)|(1<<CS10); // Fast PWM
    ICR1=4999; // PWM = 50Hz
    DDRB|=(1<<PORTB1)|(1<<PORTB2);
    servo_set(ANGLE_START);
}

void servo_set(angle a)
{
    if (a == ANGLE_START)
    {
        OCR1A = SERVO_ANGLE_START;
    }
    else if (a == ANGLE_END)
    {
        OCR1A = SERVO_ANGLE_END;
    }
}

void servo_fstep()
{
        OCR1A += SERVO_STEP;
}

void servo_bstep()
{
        OCR1A -= SERVO_STEP;
}