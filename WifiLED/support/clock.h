#ifndef CLOCK_H
#define CLOCK_H

#include <stdio.h>
#include <stdint.h>

#include <libopencm3/stm32/rcc.h>

#ifdef __cplusplus
extern "C" {
#endif

void init_clock(clock_scale_t *clocks);
    
float time_s(void);
    
void delay(int32_t ms);
    
#ifdef __cplusplus
}
#endif

#endif // CLOCK_H
