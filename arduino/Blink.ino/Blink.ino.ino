/*
  Blink
  Turns on an LED on for one second, then off for one second, repeatedly.

  Most Arduinos have an on-board LED you can control. On the Uno and
  Leonardo, it is attached to digital pin 13. If you're unsure what
  pin the on-board LED is connected to on your Arduino model, check
  the documentation at http://arduino.cc

  This example code is in the public domain.

  modified 8 May 2014
  by Scott Fitzgerald
  
  Modified by Roger Clark. www.rogerclark.net for Maple mini 25th April 2015 , where the LED is on PB1
  
 */
/*
 * Modified by PICATOUT 2018-08-28, GREEN LED on PC13
 */

#define GRN_LED PC13
// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin PB1 as an output.
  pinMode(GRN_LED, OUTPUT);
}

// the loop function runs over and over again forever
// LED allumé lorsque sortie à LOW
void loop() {
  digitalWrite(GRN_LED, HIGH);   // turn the LED off (HIGH is the voltage level)
  delay(1000);              // wait for a second
  digitalWrite(GRN_LED, LOW);    // turn the LED on by making the voltage LOW
  delay(1000);              // wait for a second
}
