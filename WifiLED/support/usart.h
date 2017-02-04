#ifndef USART_H
#define USART_H

#include <stdio.h>

#include <libopencm3/stm32/usart.h>

#ifdef __cplusplus
extern "C" {
#endif

FILE *open_usart2(uint32_t baudrate);

int usart2_send(char *ptr, int len);

int usart2_recv(char *ptr, int len);
    
#ifdef __cplusplus
}
#endif

#endif // USART_H
