#ifndef _UART_H
#define _UART_H

#define BAUD 9600

void uart_init();
char getchar(void);
void putchar(char c);
void puts(const char *s);

#endif
