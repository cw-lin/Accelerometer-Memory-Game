# This file was automagically generated by mbed.org. For more information, 
# see http://mbed.org/handbook/Exporting-to-GCC-ARM-Embedded

###############################################################################
# Boiler-plate

# cross-platform directory manipulation
ifeq ($(shell echo $$OS),$$OS)
    MAKEDIR = if not exist "$(1)" mkdir "$(1)"
    RM = rmdir /S /Q "$(1)"
else
    MAKEDIR = '$(SHELL)' -c "mkdir -p \"$(1)\""
    RM = '$(SHELL)' -c "rm -rf \"$(1)\""
endif

OBJDIR := BUILD
# Move to the build directory
ifeq (,$(filter $(OBJDIR),$(notdir $(CURDIR))))
.SUFFIXES:
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
MAKETARGET = '$(MAKE)' --no-print-directory -C $(OBJDIR) -f '$(mkfile_path)' \
		'SRCDIR=$(CURDIR)' $(MAKECMDGOALS)
.PHONY: $(OBJDIR) clean
all:
	+@$(call MAKEDIR,$(OBJDIR))
	+@$(MAKETARGET)
$(OBJDIR): all
Makefile : ;
% :: $(OBJDIR) ; :
clean :
	$(call RM,$(OBJDIR))

else

# trick rules into thinking we are in the root, when we are in the bulid dir
VPATH = ..

# Boiler-plate
###############################################################################
# Project settings

PROJECT := Final_Project


# Project settings
###############################################################################
# Objects and Paths

OBJECTS += 4DGL-uLCD-SE/uLCD_4DGL_Graphics.o
OBJECTS += 4DGL-uLCD-SE/uLCD_4DGL_Media.o
OBJECTS += 4DGL-uLCD-SE/uLCD_4DGL_Text.o
OBJECTS += 4DGL-uLCD-SE/uLCD_4DGL_main.o
OBJECTS += main.o
OBJECTS += mbed-rtos/rtos/Mutex.o
OBJECTS += mbed-rtos/rtos/RtosTimer.o
OBJECTS += mbed-rtos/rtos/Semaphore.o
OBJECTS += mbed-rtos/rtos/Thread.o
OBJECTS += mbed-rtos/rtos/rtos_idle.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/HAL_CM.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/RTX_Conf_CM.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/TARGET_M3/TOOLCHAIN_ARM/HAL_CM3.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/TARGET_M3/TOOLCHAIN_ARM/SVC_Table.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/rt_CMSIS.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/rt_Event.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/rt_List.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/rt_Mailbox.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/rt_MemBox.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/rt_Memory.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/rt_Mutex.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/rt_OsEventObserver.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/rt_Robin.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/rt_Semaphore.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/rt_System.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/rt_Task.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/rt_Time.o
OBJECTS += mbed-rtos/rtx/TARGET_CORTEX_M/rt_Timer.o

 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/CRP.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/analogin_api.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/analogout_api.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/can_api.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/ethernet_api.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/flash_api.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/gpio_api.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/gpio_irq_api.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/i2c_api.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/mbed_board.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/mbed_retarget.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/mbed_sdk_boot.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/pinmap.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/port_api.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/pwmout_api.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/rtc_api.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/serial_api.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/sleep.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/spi_api.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/startup_LPC17xx.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/system_LPC17xx.o
 SYS_OBJECTS += mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/us_ticker.o

INCLUDE_PATHS += -I../
INCLUDE_PATHS += -I../.
INCLUDE_PATHS += -I../4DGL-uLCD-SE
INCLUDE_PATHS += -I../mbed-rtos
INCLUDE_PATHS += -I../mbed-rtos/rtos
INCLUDE_PATHS += -I../mbed-rtos/rtx
INCLUDE_PATHS += -I../mbed-rtos/rtx/TARGET_CORTEX_M
INCLUDE_PATHS += -I../mbed-rtos/rtx/TARGET_CORTEX_M/TARGET_M3
INCLUDE_PATHS += -I../mbed-rtos/rtx/TARGET_CORTEX_M/TARGET_M3/TOOLCHAIN_ARM
INCLUDE_PATHS += -I../mbed-rtos/targets
INCLUDE_PATHS += -I../mbed-rtos/targets/TARGET_NXP
INCLUDE_PATHS += -I../mbed/.
INCLUDE_PATHS += -I../mbed/TARGET_LPC1768
INCLUDE_PATHS += -I../mbed/TARGET_LPC1768/TARGET_NXP
INCLUDE_PATHS += -I../mbed/TARGET_LPC1768/TARGET_NXP/TARGET_LPC176X
INCLUDE_PATHS += -I../mbed/TARGET_LPC1768/TARGET_NXP/TARGET_LPC176X/TARGET_MBED_LPC1768
INCLUDE_PATHS += -I../mbed/TARGET_LPC1768/TARGET_NXP/TARGET_LPC176X/device
INCLUDE_PATHS += -I../mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD
INCLUDE_PATHS += -I../mbed/drivers
INCLUDE_PATHS += -I../mbed/hal
INCLUDE_PATHS += -I../mbed/platform

LIBRARY_PATHS := --userlibpath ../mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD 
LIBRARIES := mbed.ar 
LINKER_SCRIPT ?= ../mbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD/LPC1768.sct

# Objects and Paths
###############################################################################
# Tools and Flags

AS      = 'armcc' '-c' '--gnu' '-O3' '-Otime' '--split_sections' '--apcs=interwork' '--cpu=Cortex-M3'
CC      = 'armcc' '-c' '--gnu' '-O3' '-Otime' '--split_sections' '--apcs=interwork' '--cpu=Cortex-M3' '--md' '--no_depend_system_headers' '--c99' '-D__ASSERT_MSG'
CPP     = 'armcc' '-c' '--gnu' '-O3' '-Otime' '--split_sections' '--apcs=interwork' '--cpu=Cortex-M3' '--md' '--no_depend_system_headers' '--c99' '-D__ASSERT_MSG' '--cpp' '--no_rtti'
LD      = 'armlink'
ELF2BIN = 'fromelf'



C_FLAGS += --md
C_FLAGS += --no_depend_system_headers
C_FLAGS += --c99
C_FLAGS += -D__ASSERT_MSG
C_FLAGS += -DDEVICE_SLEEP=1
C_FLAGS += -DFEATURE_LWIP=1
C_FLAGS += -D__MBED__=1
C_FLAGS += -DDEVICE_I2CSLAVE=1
C_FLAGS += -DTARGET_LIKE_MBED
C_FLAGS += -DTARGET_NXP
C_FLAGS += -DTARGET_LPC176X
C_FLAGS += -D__MBED_CMSIS_RTOS_CM
C_FLAGS += -DDEVICE_RTC=1
C_FLAGS += -DTOOLCHAIN_object
C_FLAGS += -D__CMSIS_RTOS
C_FLAGS += -DDEVICE_DEBUG_AWARENESS=1
C_FLAGS += -DDEVICE_CAN=1
C_FLAGS += -DTARGET_LIKE_CORTEX_M3
C_FLAGS += -DTARGET_CORTEX_M
C_FLAGS += -DARM_MATH_CM3
C_FLAGS += -DDEVICE_ANALOGOUT=1
C_FLAGS += -DTARGET_UVISOR_UNSUPPORTED
C_FLAGS += -DTARGET_M3
C_FLAGS += -DDEVICE_PWMOUT=1
C_FLAGS += -DDEVICE_INTERRUPTIN=1
C_FLAGS += -DTARGET_LPCTarget
C_FLAGS += -DTARGET_CORTEX
C_FLAGS += -DDEVICE_I2C=1
C_FLAGS += -DDEVICE_PORTOUT=1
C_FLAGS += -D__CORTEX_M3
C_FLAGS += -DDEVICE_STDIO_MESSAGES=1
C_FLAGS += -DTARGET_LPC1768
C_FLAGS += -DTARGET_RELEASE
C_FLAGS += -DDEVICE_PORTINOUT=1
C_FLAGS += -DDEVICE_SERIAL_FC=1
C_FLAGS += -DTARGET_MBED_LPC1768
C_FLAGS += -DDEVICE_PORTIN=1
C_FLAGS += -DMBED_BUILD_TIMESTAMP=1515032712.15
C_FLAGS += -DDEVICE_SPI=1
C_FLAGS += -DDEVICE_ETHERNET=1
C_FLAGS += -DDEVICE_SPISLAVE=1
C_FLAGS += -DDEVICE_ANALOGIN=1
C_FLAGS += -DDEVICE_SERIAL=1
C_FLAGS += -DDEVICE_FLASH=1
C_FLAGS += -DDEVICE_SEMIHOST=1
C_FLAGS += -DTOOLCHAIN_ARM
C_FLAGS += -DTOOLCHAIN_ARM_STD
C_FLAGS += -DDEVICE_LOCALFILESYSTEM=1
C_FLAGS += --preinclude=mbed_config.h

CXX_FLAGS += --cpp
CXX_FLAGS += --no_rtti
CXX_FLAGS += -DDEVICE_SLEEP=1
CXX_FLAGS += -DFEATURE_LWIP=1
CXX_FLAGS += -D__MBED__=1
CXX_FLAGS += -DDEVICE_I2CSLAVE=1
CXX_FLAGS += -DTARGET_LIKE_MBED
CXX_FLAGS += -DTARGET_NXP
CXX_FLAGS += -DTARGET_LPC176X
CXX_FLAGS += -D__MBED_CMSIS_RTOS_CM
CXX_FLAGS += -DDEVICE_RTC=1
CXX_FLAGS += -DTOOLCHAIN_object
CXX_FLAGS += -D__CMSIS_RTOS
CXX_FLAGS += -DDEVICE_DEBUG_AWARENESS=1
CXX_FLAGS += -DDEVICE_CAN=1
CXX_FLAGS += -DTARGET_LIKE_CORTEX_M3
CXX_FLAGS += -DTARGET_CORTEX_M
CXX_FLAGS += -DARM_MATH_CM3
CXX_FLAGS += -DDEVICE_ANALOGOUT=1
CXX_FLAGS += -DTARGET_UVISOR_UNSUPPORTED
CXX_FLAGS += -DTARGET_M3
CXX_FLAGS += -DDEVICE_PWMOUT=1
CXX_FLAGS += -DDEVICE_INTERRUPTIN=1
CXX_FLAGS += -DTARGET_LPCTarget
CXX_FLAGS += -DTARGET_CORTEX
CXX_FLAGS += -DDEVICE_I2C=1
CXX_FLAGS += -DDEVICE_PORTOUT=1
CXX_FLAGS += -D__CORTEX_M3
CXX_FLAGS += -DDEVICE_STDIO_MESSAGES=1
CXX_FLAGS += -DTARGET_LPC1768
CXX_FLAGS += -DTARGET_RELEASE
CXX_FLAGS += -DDEVICE_PORTINOUT=1
CXX_FLAGS += -DDEVICE_SERIAL_FC=1
CXX_FLAGS += -DTARGET_MBED_LPC1768
CXX_FLAGS += -DDEVICE_PORTIN=1
CXX_FLAGS += -DMBED_BUILD_TIMESTAMP=1515032712.15
CXX_FLAGS += -DDEVICE_SPI=1
CXX_FLAGS += -DDEVICE_ETHERNET=1
CXX_FLAGS += -DDEVICE_SPISLAVE=1
CXX_FLAGS += -DDEVICE_ANALOGIN=1
CXX_FLAGS += -DDEVICE_SERIAL=1
CXX_FLAGS += -DDEVICE_FLASH=1
CXX_FLAGS += -DDEVICE_SEMIHOST=1
CXX_FLAGS += -DTOOLCHAIN_ARM
CXX_FLAGS += -DTOOLCHAIN_ARM_STD
CXX_FLAGS += -DDEVICE_LOCALFILESYSTEM=1
CXX_FLAGS += --preinclude=mbed_config.h

ASM_FLAGS += -D__CMSIS_RTOS
ASM_FLAGS += -D__MBED_CMSIS_RTOS_CM
ASM_FLAGS += -D__CORTEX_M3
ASM_FLAGS += -DARM_MATH_CM3
ASM_FLAGS += -I.
ASM_FLAGS += -Imbed-rtos
ASM_FLAGS += -Imbed-rtos/rtos
ASM_FLAGS += -Imbed-rtos/rtx
ASM_FLAGS += -Imbed-rtos/rtx/TARGET_CORTEX_M
ASM_FLAGS += -Imbed-rtos/rtx/TARGET_CORTEX_M/TARGET_M3
ASM_FLAGS += -Imbed-rtos/rtx/TARGET_CORTEX_M/TARGET_M3/TOOLCHAIN_ARM
ASM_FLAGS += -Imbed-rtos/targets
ASM_FLAGS += -Imbed-rtos/targets/TARGET_NXP
ASM_FLAGS += -I4DGL-uLCD-SE
ASM_FLAGS += -Imbed/.
ASM_FLAGS += -Imbed/TARGET_LPC1768
ASM_FLAGS += -Imbed/TARGET_LPC1768/TARGET_NXP
ASM_FLAGS += -Imbed/TARGET_LPC1768/TARGET_NXP/TARGET_LPC176X
ASM_FLAGS += -Imbed/TARGET_LPC1768/TARGET_NXP/TARGET_LPC176X/TARGET_MBED_LPC1768
ASM_FLAGS += -Imbed/TARGET_LPC1768/TARGET_NXP/TARGET_LPC176X/device
ASM_FLAGS += -Imbed/TARGET_LPC1768/TOOLCHAIN_ARM_STD
ASM_FLAGS += -Imbed/drivers
ASM_FLAGS += -Imbed/hal
ASM_FLAGS += -Imbed/platform


LD_FLAGS :=--show_full_path 
LD_SYS_LIBS := 

# Tools and Flags
###############################################################################
# Rules

.PHONY: all lst size


all: $(PROJECT).bin $(PROJECT).hex size


.s.o:
	+@$(call MAKEDIR,$(dir $@))
	+@echo "Assemble: $(notdir $<)"
  
	@$(AS) -c $(ASM_FLAGS) -E -o $(@:.o=.E.s) $<
	@$(AS) -c $(ASM_FLAGS) -o $@ $(@:.o=.E.s)
  


.S.o:
	+@$(call MAKEDIR,$(dir $@))
	+@echo "Assemble: $(notdir $<)"
  
	@$(AS) -c $(ASM_FLAGS) -E -o $(@:.o=.E.s) $<
	@$(AS) -c $(ASM_FLAGS) -o $@ $(@:.o=.E.s)
  

.c.o:
	+@$(call MAKEDIR,$(dir $@))
	+@echo "Compile: $(notdir $<)"
	@$(CC) $(C_FLAGS) $(INCLUDE_PATHS) -o $@ $<

.cpp.o:
	+@$(call MAKEDIR,$(dir $@))
	+@echo "Compile: $(notdir $<)"
	@$(CPP) $(CXX_FLAGS) $(INCLUDE_PATHS) -o $@ $<




$(PROJECT).elf: $(OBJECTS) $(SYS_OBJECTS)  $(LINKER_SCRIPT) 
	+@echo "link: $(notdir $@)"
	@$(LD) $(LD_FLAGS) --scatter $(filter-out %.o, $^) $(LIBRARY_PATHS) --output $@ $(filter %.o, $^) $(LIBRARIES) $(LD_SYS_LIBS)


$(PROJECT).bin: $(PROJECT).elf
	$(ELF2BIN) --bin --output $@ $<
	+@echo "===== bin file ready to flash: $(OBJDIR)/$@ =====" 

$(PROJECT).hex: $(PROJECT).elf
	$(ELF2BIN) --i32 --output $@ $<


# Rules
###############################################################################
# Dependencies

DEPS = $(OBJECTS:.o=.d) $(SYS_OBJECTS:.o=.d)
-include $(DEPS)
endif

# Dependencies
###############################################################################
