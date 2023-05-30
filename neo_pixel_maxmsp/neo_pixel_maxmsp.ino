#include <Adafruit_NeoPixel.h>


// Which pin on the Arduino is connected to the NeoPixels?
// On a Trinket or Gemma we suggest changing this to 1:
#define LED_PIN 7

// How many NeoPixels are attached to the Arduino?
#define LED_COUNT 1

// Declare our NeoPixel strip object:
Adafruit_NeoPixel strip(LED_COUNT, LED_PIN, NEO_GRB + NEO_KHZ800);

int value;




void setup() {
  // put your setup code here, to run once:


Serial.begin(57600);
strip.begin();
strip.show();

}

void loop() {
  // put your main code here, to run repeatedly:
if(Serial.available() > 0) {

  value = Serial.read();
  Serial.println(value);

  if(value == 1) {
    strip.setPixelColor(0, strip.Color(255, 0, 0));
      strip.setPixelColor(1, strip.Color(255, 20, 255));
    // colorWipe(strip.Color(255, 0, 0), 500);
    strip.show();
  } 
  else if(value == 0) {


    strip.setPixelColor(0, strip.Color(0, 20, 255));
    strip.setPixelColor(1, strip.Color(0, 20, 255));
    // colorWipe(strip.Color(255, 0, 0), 500);
    strip.show();
         
 }

}
}
