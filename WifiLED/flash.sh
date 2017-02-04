#!/bin/bash

# tell the bootloader we have 3.3V supply, to enable faster flashing
# http://www.st.com/st-web-ui/static/active/en/resource/technical/document/application_note/CD00167594.pdf (p. 22)
#dfu-util -d 0483:df11 -a 3 -s 0xFFFF0000 -D ../option_3V3

dfu-util -d 0483:df11 -a 0 -s 0x08000000 -D WifiLED.bin
