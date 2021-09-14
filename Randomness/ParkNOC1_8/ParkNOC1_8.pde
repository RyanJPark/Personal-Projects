/* Ryan P  9/3/19
"color practice"
Information Engineering  '18-19     St. Mark's School of Texas 

Code Abstract: "Play with color, noiseDetail(), and the rate at which xoff and yoff are incremented to achieve different visual effects."
Source(s): "Identify any sources for your inspiration or code. Include hyperlinks to external sites or which example folder was used."

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License v3 as published by the Free Software Foundation
*/

float t=100;
int x;
int y;
int toff=286;

void setup(){
  size(1280,1280);
  frameRate(10);
}

void draw(){
  float xoff = 0.0; //[bold]

  for (int x = 0; x < width; x++) {
    float yoff = 0.0;
    for (int y = 0; y < height; y++) {
      float bright = map(noise(xoff,yoff),0,1,0,255);
      pixels[x+y*width] = color(bright);
      yoff += 0.01;
    }
    xoff += 0.01;
  }
}
