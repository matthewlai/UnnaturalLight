#include "usart.h"

#include <stdio.h>
#include <stdlib.h>

#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/cm3/nvic.h>

#include "fileno.h"

#define RX_BUF_SIZE 4096
static volatile char rx_buf[RX_BUF_SIZE];
static volatile size_t rx_buf_head = 0; // where the next character should be inserted
static volatile size_t rx_buf_tail = 0; // where the next character should be read from

void usart2_isr(void)
{
    static uint8_t data = 0;
    
    /* Check if we were called because of RXNE. */
    if (((USART_CR1(USART2) & USART_CR1_RXNEIE) != 0) &&
        ((USART_SR(USART2) & USART_SR_RXNE) != 0)) {
        
        /* Retrieve the data from the peripheral. */
        data = usart_recv(USART2);
        
        if (((rx_buf_head + 1) % RX_BUF_SIZE) != rx_buf_tail) // we still have space
        {
            rx_buf[rx_buf_head] = data;
            rx_buf_head = (rx_buf_head + 1) % RX_BUF_SIZE;
        }
    }
}

static char usart2_rx_buf_getc(void)
{
    // block if there is no data
    while (rx_buf_tail == rx_buf_head) {}
    
    // block if receiving is still in progress (if we saw buf size > 0 already,
    // by the time receiving finishes, we'll still have buf size > 0)
    
    char ret = rx_buf[rx_buf_tail];
    
    rx_buf_tail = (rx_buf_tail + 1) % RX_BUF_SIZE;
    
    return ret;
}

FILE *open_usart2(uint32_t baudrate)
{
    rcc_periph_clock_enable(RCC_USART2);
    
    rcc_periph_clock_enable(RCC_GPIOA);
    
    /* Enable the USART2 interrupt. */
    nvic_enable_irq(NVIC_USART2_IRQ);
    
    /* Setup GPIO pins for USART2 transmit. */
    gpio_mode_setup(GPIOA, GPIO_MODE_AF, GPIO_PUPD_NONE, GPIO2);
    
    /* Setup GPIO pins for USART2 receive. */
    gpio_mode_setup(GPIOA, GPIO_MODE_AF, GPIO_PUPD_NONE, GPIO3);
    gpio_set_output_options(GPIOA, GPIO_OTYPE_OD, GPIO_OSPEED_25MHZ, GPIO3);
    
    /* Setup USART2 TX and RX pin as alternate function. */
    gpio_set_af(GPIOA, GPIO_AF7, GPIO2);
    gpio_set_af(GPIOA, GPIO_AF7, GPIO3);
    
    /* Setup USART2 parameters. */
    usart_set_baudrate(USART2, baudrate);
    usart_set_databits(USART2, 8);
    usart_set_stopbits(USART2, USART_STOPBITS_1);
    usart_set_mode(USART2, USART_MODE_TX_RX);
    usart_set_parity(USART2, USART_PARITY_NONE);
    usart_set_flow_control(USART2, USART_FLOWCONTROL_NONE);
    
    /* Enable USART2 Receive interrupt. */
    usart_enable_rx_interrupt(USART2);
    
    /* Finally enable the USART. */
    usart_enable(USART2);
    
    FILE *ret = fdopen(USART2_FILENO, "r+");
    
    setvbuf(ret, NULL, _IONBF, 0);
    
    return ret;
}

int usart2_send(char *ptr, int len)
{
    for (int i = 0; i < len; ++i)
    {
        usart_send_blocking(USART2, ptr[i]);
    }
    
    return len;
}

int usart2_recv(char *ptr, int len)
{
    for (int i = 0; i < len; ++i)
    {
        ptr[i] = usart2_rx_buf_getc();
    }
    
    return len;
}
