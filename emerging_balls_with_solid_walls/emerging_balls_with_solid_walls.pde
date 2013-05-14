int _num=10;
Circle[] _circleArr = {};

void setup() {
  size(500, 300);
  background(255);
  smooth();
  strokeWeight(1);
  fill(150, 50);
  drawCircles();
}

void draw() {
  background(255);
  for(int i=0; i< _circleArr.length; i++) {
    Circle thisCirc = _circleArr[i];
    thisCirc.updateMe();
  }
}

void mouseReleased() {
  drawCircles();
}

void drawCircles() {
  for (int i=0; i<_num; i++) {
    Circle thisCirc = new Circle();
    thisCirc.drawMe();
    _circleArr = (Circle[])append(_circleArr, thisCirc);
  }
}


class Circle {
  
  float x, y, radius, alph, xmove, ymove, oldXMove, oldYMove;
  color linecol, fillcol;
  
  Circle() {
    x = random(width);
    y = random(height);
    
    radius = 20;
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    alph = random(255);
    
    xmove = random(1) - 0.5;
    ymove = random(1) - 0.5;
  }
  
  
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius * 2, radius * 2);
    stroke(linecol, 150);
    noFill();
    ellipse(x, y, 10, 10);
  }
  
  void updateMe() {
    
    x += xmove;
    y += ymove;
    
    if (x > (width - radius)) { xmove = -xmove; }
    if (x < radius) { xmove = -xmove; }
    if (y > (height - radius)) { ymove = -ymove; }
    if (y < radius) { ymove = -ymove; }
    
    boolean touching = false;
    for (int i=0; i<_circleArr.length; i++) {
      Circle otherCirc = _circleArr[i];
      if (otherCirc != this) {
        float dis = dist(x, y, otherCirc.x, otherCirc.y);
        if ((dis - radius - otherCirc.radius) < 0) {
          
          oldXMove = xmove;
          oldYMove = ymove;
          
          xmove = - otherCirc.xmove;
          ymove = - otherCirc.ymove;
          
          otherCirc.xmove = - oldXMove;
          otherCirc.ymove = - oldYMove;
          
          touching = true;
           break;
        }
      }
    }
    
//    if (touching) {
//      if (alph > 0) {alph--;}
//    } else {
//      if (alph < 255) {alph += 2;}
//    }
    
    drawMe();
    
    
  }
}
