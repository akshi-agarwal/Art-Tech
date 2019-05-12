/*
Name: Akshita Agarwal
Sketch 1
To get a more efficient code for the breating circle - https://www.openprocessing.org/sketch/108563/
Change the background color when the mouse moves - https://www.openprocessing.org/sketch/501512

I wanted to convey a feeling of walking indoors when it's really cold outside. 
The circle in the middle depicts breathing, especially a calm one. The yellow shows a feeling of 
warmth that one gets being indoors on a cold and windy day. 

The background changes colors from white-ish to black-ish. Those are just colors I 
personally associate with winter. White because of snow and black because the nights are
longer. 
*/

int bR, wR, iR, oR, cR; //borderRadius, whiteRadius, inner Radius, outer Radius
float iP, oP, cP; // innerPulse, outerPulse, corePulse
int r, g, b;
float pulseRate;

void setup() {

  size(displayWidth, displayHeight);
  background(#FFFFFF);
  smooth(8);
  
  //setting radius of all circles
  bR = 415;
  wR = 400;
  oR = 300;
  iR = 240;
  cR = 160;
  
  //setting how far the circle will pulse
  iP = 0;
  oP = 0;
  cP = 0;
  
  //how fast the circle will pulse
  pulseRate = 0.03;
}

void draw() {
  
  //setting background color
  fill(setBGColor());
  rect(0, 0, width, height);

  // pulsing circle
  pushMatrix();
  translate(width/2, height/2);
  pulse();
  popMatrix();
}

void pulse() {
  noStroke();
  
  pushMatrix();

  //border circle
  oP+=pulseRate;
  fill(setPulseColor());
  ellipse(0, 0, bR+24*sin(oP), bR+18*sin(oP));
  
  //white part of the circle
  fill(255);
  ellipse(0, 0, wR+24*sin(oP), wR+18*sin(oP));

  //outer circle
  fill(setPulseColor(), 50);
  ellipse(0, 0, oR+8*sin(oP), oR+12*sin(oP));

  //inner circle
  fill(setPulseColor(), 100);
  iP+=pulseRate;
  ellipse(0, 0, iR+10*sin(iP), iR+6*sin(iP));

  //core circle
  fill(setPulseColor(), 150);
  cP+=pulseRate;
  ellipse(0, 0, cR+10*sin(cP), cR+6*sin(cP));
  popMatrix();
}

//The shade of yellow changes when the mouse moves on the screen
color setPulseColor() {
  
  r =  234 + 3*mouseX/width;
  g =  196 - 52*mouseX/width;
  b = 44 - 2*mouseX/width;
  color from = color(r, g, b);
  
  r =  237 - 3*mouseY/height;
  g =  154 + 52*mouseY/height;
  b =  42 + 2*mouseY/height;
  color to = color(r, g, b);
  
  color pulse = lerpColor(from, to, .33);
  return pulse;
  
}

//The background shade changes when the mouse moves on the screen
color setBGColor() {

  r =  248 - 228*mouseX/width;
  g =  248 - 226*mouseX/width;
  b = 248 - 217*mouseX/width;
  color from = color(r, g, b);
  
  r = 20 + 228*mouseY/height;
  g =  22 + 226*mouseY/height;
  b =  31 + 217*mouseY/height;
  color to = color(r, g, b);

  color bg = lerpColor(from, to, .33);
  return bg;
}
