### DISCLAIMER
### This Makefile is designed for use with the sudar Arduino.mk
### Refer to https://github.com/sudar/Arduino-Makefile
### Currently sudar version 1.5.2 (2017-01-11)
###

### PROJECT_DIR
### This is the base path to where you have created/cloned your project
PROJECT_DIR       = /Users/levi/synth/midi2cv

### AVR_GCC_VERSION
### Check if the version is equal or higher than 4.9
AVR_GCC_VERSION  := $(shell expr `avr-gcc -dumpversion | cut -f1` \>= 4.9)

### ARDMK_DIR
### Path to the Arduino-Makefile directory.
ARDMK_DIR         = $(PROJECT_DIR)/Arduino-Makefile

### ARDUINO_DIR
### Path to the Arduino application and resources directory.
# ARDUINO_DIR        = /Users/levi/Documents/Arduino
# ARDUINO_DIR        = /Users/levi/Library/Arduino15/packages/ATTinyCore/hardware/avr/1.1.5
# ARDUINO_DIR        = /Users/levi/Library/Arduino15/packages/ATTinyCore/hardware/avr/1.1.5

### USER_LIB_PATH
### Path to where the your project's libraries are stored.
USER_LIB_PATH      =  /Users/levi/synth/include
#  USER_LIB_PATH      =  /Users/levi/synth/midi2cv/include
# USER_LIB_PATH     :=  $(realpath $(PROJECT_DIR)/../include)

### BOARD_TAG & BOARD_SUB
BOARD_TAG         = attinyx5
BOARD_SUB         = 85
### For ATTinyCore
ALTERNATE_CORE      = ATTinyCore
ALTERNATE_CORE_PATH = /Users/levi/Library/Arduino15/packages/ATTinyCore/hardware/avr/1.1.5
F_CPU=8000000L

### MONITOR_BAUDRATE
### It must be set to Serial baudrate value you are using.
MONITOR_BAUDRATE  = 115200

### AVRDUDE
ISP_PORT          = /dev/cu.usbmodem1421
AVRDUDE_ARD_PROGRAMMER = arduino
AVRDUDE_ARD_BAUDRATE = 19200
### Path to avrdude directory.
AVRDUDE           = /usr/local/CrossPack-AVR/bin/avrdude
### Path to the AVR tools directory such as avr-gcc, avr-g++, etc.
AVR_TOOLS_DIR     = /usr/local/CrossPack-AVR

### CFLAGS_STD
### Set the C standard to be used during compilation. Documentation \ (https://github.com/WeAreLeka/Arduino-Makefile/blob/std-flags/arduino-mk-vars.md#cflags_std)
CFLAGS_STD        = -std=gnu11

### CXXFLAGS_STD
### Set the C++ standard to be used during compilation. Documentation \ (https://github.com/WeAreLeka/Arduino-Makefile/blob/std-flags/arduino-mk-vars.md#cxxflags_std)
CXXFLAGS_STD      = -std=gnu++11

### CXXFLAGS
### Flags you might want to set for debugging purpose. Comment to stop.
CXXFLAGS         += -pedantic -Wall -Wextra

### MONITOR_PORT
### The port your board is connected to. Using an '*' tries all the ports and finds the right one.
MONITOR_PORT      = /dev/cu.usbmodem1421

### CURRENT_DIR
### Do not touch - used for binaries path
CURRENT_DIR       = $(shell basename $(CURDIR))

### OBJDIR
### This is where you put the binaries you just compile using 'make'
OBJDIR            = $(PROJECT_DIR)/$(CURRENT_DIR)/$(BOARD_TAG)/bin

### Do not touch - the path to Arduino.mk, inside the ARDMK_DIR
include $(ARDMK_DIR)/Arduino.mk

