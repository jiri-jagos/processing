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
  
  float x, xmove, oldXMove,
        y, ymove, oldYMove,
        weightRatio,
        radius, oldRadius, 
        alph;
  color linecol, fillcol;
  
  Circle() {
    x = random(width);
    y = random(height);
    xmove = random(2) - 1;
    ymove = random(2) - 1;
    
    radius = random(20) + 5;
    
    linecol = color(random(255), random(255), random(255));
    fillcol = color(random(255), random(255), random(255));
    
    alph = random(255) + 125;
    
  }
  
  
  void drawMe() {
    noStroke();
    fill(fillcol, alph);
    ellipse(x, y, radius * 2, radius * 2);
    stroke(linecol, 150);
    noFill();
    ellipse(x, y, 10, 10);
  }
  
  void collision(Circle otherCirc) {
          oldXMove = this.xmove;
          oldYMove = this.ymove;
          oldRadius = this.radius;
          
          weightRatio = this.radius / otherCirc.radius;
          
          this.xmove = otherCirc.xmove / weightRatio;
          this.ymove = otherCirc.ymove / weightRatio;
//          if (
//            x + radius <= otherCirc.x + otherCirc.radius &&
//            y + radius <= otherCirc.y + otherCirc.radius
//          ) {
//            radius -= weightRatio * otherCirc.radius;
//          } else {
//            radius += weightRatio * otherCirc.radius;
//          }
//          
          otherCirc.xmove = oldXMove * weightRatio;
          otherCirc.ymove = oldYMove * weightRatio;
//          otherCirc.radius += oldRadius;
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
        if ((dis - radius - otherCirc.radius) <= 0) {
          
          collision(otherCirc);
          
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
