#include "mbed.h"
#include "uLCD_4DGL.h"
#include "rtos.h"
#include <time.h>

//Main Thread, accel thread, and games thread
Thread accel;
Thread games;

//Added "--_ARROW" to avoid incompatibility with uLCD_4DGL.h
//Define Game Macro
#define UP_ARROW 0
#define DOWN_ARROW 1
#define LEFT_ARROW 2
#define RIGHT_ARROW 3
#define RUNNING 2

//Define uLCD object
uLCD_4DGL uLCD(p28,p27,p11);

//Define i2c object
I2CSlave slave(p9, p10);

//Define i2c address
const int addr = 0x00;

DigitalOut p1_bit(p24);
DigitalOut p2_bit(p23);
DigitalOut p3_bit(p22);
DigitalOut p4_bit(p21);

DigitalIn button(p8);

int seconds = 8;

int solution[30];
int answer[30];
int level = 5;
//act as interrupt to stop thread early
bool timesUp = false;
bool finishedAnswer = false;

void accelerometer()
{
    char buf[30];
    slave.address(addr);
    bool loadNext = true;
    bool loadFirst = true;
    int answer_count = 0;
    while (answer_count < level && !timesUp) {

        int i = slave.receive();
        //printf("\n\ri= %d\n", i);
        switch (i) {
            case I2CSlave::ReadAddressed:
                //slave.write(msg, strlen(msg) + 1); // Includes null char
                //printf("--1--");
                break;
            case I2CSlave::WriteGeneral:
                slave.read(buf, 30);
                //printf("Read G: %s\n", buf);
                break;
            case I2CSlave::WriteAddressed:
                slave.read(buf, 30);
                //printf("Read A: %s\n", buf);
                break;
            default:
                //printf("default\n");
                break;
        }
        if(loadFirst) {
            if(buf[0] == '2' && buf[0] == '2') loadFirst = false;

        }
        if(loadNext && !loadFirst) {
            bool edge = true;

            if(buf[0] == '0' && buf[2] == '2') {
                //LEFT ARROW
                edge = false;
                answer[answer_count] = LEFT_ARROW;
                printf("LEFT_ARROW\n");
            } else if(buf[0] == '2' && buf[2] == '0') {
                edge = false;
                answer[answer_count] = UP_ARROW;
                printf("UP_ARROW\n");
            } else if(buf[0] == '2' && buf[2] == '4') {
                edge = false;
                answer[answer_count] = DOWN_ARROW;
                printf("DOWN_ARROW\n");
            } else if(buf[0] == '4' && buf[2] == '2') {
                edge = false;
                answer[answer_count] = RIGHT_ARROW;
                printf("RIGHT_ARROW\n");
            }
            loadNext = edge;
            if(!loadNext) answer_count++;
        } else {
            if(buf[0] == '2' && buf[2] == '2') {
                loadNext = true;

            }
        }
        for(int i = 0; i < 29; i++) buf[i] = 0;    // Clear buffer
        if(answer_count >= level) {
            finishedAnswer = true;
        }
    }
}
void countdown(int seconds)
{
    //Time shown in binary with 4 led
    p1_bit = 0;
    p2_bit = 0;
    p3_bit = 0;
    p4_bit = 0;
    int temp;
    for(temp = seconds+5; temp > 0 ; temp--) {
        if(finishedAnswer) break;
        p1_bit = temp & 1;
        p2_bit = temp & 2;
        p3_bit = temp & 4;
        p4_bit = temp & 8;
        Thread::wait(1000);

    }
    p1_bit = 0;
    p2_bit = 0;
    p3_bit = 0;
    p4_bit = 0;
    timesUp = true;
    accel.terminate();
}

void game()
{
    uLCD.printf("\n\n\n\n\n\n   Accelerometer\n");
    uLCD.printf("\n   Memory Game");
    uLCD.text_width(4);
    uLCD.text_height(4);
    uLCD.color(RED);
    wait(1);
    uLCD.cls();
    uLCD.baudrate(3000000);
    uLCD.printf("\n   Start Level\n");
    uLCD.text_width(4); //4X size text
    uLCD.text_height(4);
    uLCD.color(RED);
    wait(1);
    while(1) {
        uLCD.cls();
        int generator;
        timesUp = false;
        finishedAnswer = false;
        for(generator = 0 ; generator < level; generator++) {

            int arrow = rand() % 4 ;

            switch(arrow) {
                case UP_ARROW:
                    uLCD.triangle(90, 50, 62, 20, 35, 50, 0xFFFFFFFF);
                    uLCD.rectangle(50, 50, 75, 100, 0xFFFFFFFF);
                    wait(0.5);
                    uLCD.cls();
                    break;
                case DOWN_ARROW:
                    uLCD.rectangle(50, 25, 75, 75, 0xFFFFFFFF);
                    uLCD.triangle(90, 75, 62, 105, 35, 75, 0xFFFFFFFF);
                    wait(0.5);
                    uLCD.cls();
                    break;
                case LEFT_ARROW:
                    uLCD.rectangle(55, 50, 105, 80, 0xFFFFFFF);
                    uLCD.triangle(55, 30, 25, 65, 55, 100, 0xFFFFFFFF);
                    wait(0.5);
                    uLCD.cls();
                    break;
                case RIGHT_ARROW:
                    uLCD.rectangle(25, 50, 75, 80, 0xFFFFFFF);
                    uLCD.triangle(75, 30, 110 , 65, 75, 100, 0xFFFFFFFF);
                    wait(0.5);
                    uLCD.cls();
                    break;
                default:
                    break;
            }
            solution[generator] = arrow;
        }

        uLCD.printf("\n\n\n\n\n  Start Solving!!\n");
        accel.start(accelerometer);
        countdown(level);
        accel.join();

        int start;
        bool correct = true;
        for(start = 0; start < level; start++) {
            printf("solution: %d, answer: %d\n",solution[start], answer[start]);
            if(solution[start] != answer[start]) correct = false;
        }
        uLCD.cls();
        if(correct) {
            uLCD.printf("\n\n\n     CORRECT! \n");
            wait(1);
            uLCD.printf("\n\n\n    NEXT LEVEL \n");
            wait(2);
            level++;
            seconds++;
        } else {
            uLCD.printf("\n\n\n\n\n\n      WRONG ! \n");
            wait(1);
            uLCD.cls();
            uLCD.printf("\n\n\n\n\n\n\n     Thank You\n   For Playing!!!");
            wait(5);
            level = 5;
        }
    }
}
int main()
{
    button.mode(PullDown);
    srand(time(NULL));              //Seed rand()
    games.start(game);              //Start Game Thread
    while(1) {                      //Main Thread wait for Button interrupt
        if (button) {                
            while (button);            
            uLCD.cls();             //Reset I/O and start over
            p1_bit = 0;
            p2_bit = 0;
            p3_bit = 0;
            p4_bit = 0;
            games.terminate();
            accel.terminate();
            games.start(game);
        }

    }
}
