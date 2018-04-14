# Accelerometer-Memory-Game

**The project contains**

* [LCP1768 microcontroller](https://os.mbed.com/platforms/mbed-LPC1768/)
* [Serial Miniature LCD Module - 1.44"(4DGL-uLCD-SE)](https://www.sparkfun.com/products/11377)
* [Microbit microcontroller](http://microbit.org/code/)

**Wiring**
  
| LCP1768       | MicroBit      | LCD Module    |
|:-------------:|:-------------:|:-------------:|
| VOUT          | VIN           | 5V            |
| GND           | GND           | GND           |
| P9(I2C)       | P20           |               |
| P10(I2C)      | P19           |               |
| P27 (Serial)  |               | RX            |
| P28 (Serial)  |               | TX            |


**Note:**
* The LCD Module pin V3.3 must be bended since reset pin is conflicting and lock up the board after reset. https://os.mbed.com/users/4180_1/notebook/ulcd-144-g2-128-by-128-color-lcd/ go to section "Easy Solution to Use" to read more about it
* Microbit is on a breakout board
* Rest of the pins are hook up to a button and four led lights
* Both Microbit and LCP1768 have separate code but Microbit's code isn't shown at this branch

**Libraries Used**
* [Mbed Real-Time Operating System(RTOS) library](https://os.mbed.com/docs/latest/reference/rtos.html) - Since microcontroller generally don't have Operating System, this library is used to solve multithreading problem for synchronous I/O pins
* 4DGL-uLCD-SE - Library for LCD module
* [Microbit-dal](https://github.com/lancaster-university/microbit-dal) - Alternative library for Microbit as main microbit library does not behave well with I2C function.
