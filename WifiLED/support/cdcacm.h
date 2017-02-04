#ifndef CDCACM_H
#define CDCACM_H

#ifdef __cplusplus
extern "C" {
#endif

void init_cdcacm(void);
void poll_cdcacm(void);
void cdcacm_send(char *data, int size);
void cdcacm_recv(char *data, int size);

#ifdef __cplusplus
}
#endif

#endif // CDCACM_H
