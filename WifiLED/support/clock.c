#include "clock.h"

#include <stdio.h>
#include <stdlib.h>

#include <libopencm3/stm32/gpio.h>
#include <libopencm3/cm3/nvic.h>

void init_clock(clock_scale_t *clocks)
{
    int32_t timerClockFreq = 0;
    
    // if APB1 pre-scalar = 1, timer clock = APB1
    // otherwise timer clock = APB1 * 2
    if (clocks->ppre1 == RCC_CFGR_PPRE_DIV_NONE)
    {
        timerClockFreq = clocks->apb1_frequency;
    }
    else
    {
        timerClockFreq = clocks->apb1_frequency * 2;
    }
    
    
}

float time_s(void)
{
    return 0.0f;
}

void delay(int32_t ms)
{
    
}
