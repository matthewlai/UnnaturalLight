#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <sys/stat.h>
#include <sys/times.h>
#include <sys/unistd.h>

#include <libopencm3/stm32/usart.h>

#include "cdcacm.h"
#include "usart.h"

#include "fileno.h"

int _write(int file, char *ptr, int len);

int _write(int file, char *ptr, int len)
{
    switch (file) {
        case STDOUT_FILENO:
            cdcacm_send(ptr, len);
            break;
        case USART2_FILENO:
            usart2_send(ptr, len);
        default:
            errno = EBADF;
            return -1;
    }
    return len;
}

int _read(int file, char *ptr, int len);

int _read(int file, char *ptr, int len)
{
    // we always only return 1 byte, because otherwise
    // we may block
    (void) len;
    
    switch (file) {
        case STDIN_FILENO:
            cdcacm_recv(ptr, 1);
            break;
        case USART2_FILENO:
            usart2_recv(ptr, 1);
            break;
        default:
            errno = EBADF;
            return -1;
    }
    return 1;
}
