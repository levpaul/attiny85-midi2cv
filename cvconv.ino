// Simple I2C test for ebay 128x64 oled.

#include <Wire.h>
#include <SoftwareSerial.h>

#include "SSD1306Ascii.h"
#include "SSD1306AsciiWire.h"

#define I2C_ADDRESS 0x3C

SSD1306AsciiWire oled;
SoftwareSerial midi (1, 3);  // Rx, Tx

int dataByte;
int velocityByte;
int result;

int isRealTimeCategory(int b)
  {
    if(b >= 0xF8)
    {
      return 1;
    }
    else
    {
      return 0;
    }
}

/**********************
//function declarations
**********************/

int isStatus(int b)
{
  if( (b & 0x80) == 0x80)
  {
    return 1;
  }
  else if( (b & 0x80) == 0)
  {
  return 0;
  }
}   

int isAftertouch(int b)
{
  if( (b & 0xf0) == 0xa0)
  {
    return 1;
  }
  else //if( (b & 0xf0) != 0xa0)
  {
    return 0;
  }
}


const byte LED = 4;   // pin 5 on ATtiny85

//------------------------------------------------------------------------------
void setup() {
  analogWrite(LED, 128);
  delay(500);
  analogWrite(LED, 0);
  delay(500);


  Wire.begin();
  oled.begin(&Adafruit128x64, I2C_ADDRESS);
  oled.clear();

  oled.setFont(Adafruit5x7);
  oled.setScroll(true);
  oled.println("Started up!");

  oled.println("Attempting midi serial");
  midi.begin(31250);
}


void loop()
{

  while(midi.available())
  {
    //This is the protocol for reading new stuff
    byte myByte = midi.read();
    if(isRealTimeCategory(myByte))
    {
      ;
    }
    else
    {
      if(isStatus(myByte))
      {

        result = (myByte | 0x80);       //0b10000000
        switch(result)
        {
          case 0b10000000:
            oled.println("0b10000000");
            break;
          case 0b10010000:
            oled.println("0b10010000");
            break;  
          case 0b10100000:
            break;
          case 0b10110000:
            break;
          case 0b11000000:
            break;
          case 0b11010000:
            break;
          case 0b11100000:
            break;
          case 0b11110000:
            break;
        }
      }
      else
      {
        byte myByte = midi.read();  //This is the protocol for reading new stuff
        if(isRealTimeCategory(myByte))
        {
          ;
        }
        else
        {
          if(myByte > 0)
      {
        oled.println("SMOKAN!!");
      }
      else
      {
        oled.println("-------");
      }
        }
      }
    }
  }
}  //END



