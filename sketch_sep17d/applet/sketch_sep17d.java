import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class sketch_sep17d extends PApplet {

int diam = 10;
float centX, centY;
public void setup() {
  size(500, 500);
  frameRate(24);	
  smooth();
  background(180);
  
  centX = width/2;
  centY = height/2;
  
  stroke(0);
  strokeWeight(5);
  fill(255, 50);
}
	
		
	
public void draw() {
  if (diam <= 400) {
    diam += 10;
  } else {
    diam -= 10;
  }
  ellipse(centX, centY, diam, diam);
}
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#DFDFDF", "sketch_sep17d" });
  }
}
