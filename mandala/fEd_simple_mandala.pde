class simpleMandala {
  
  PVector center;
  int pointCount = 8;
  int steps = 50;
  
  float outerRadius = width * .5;
  float innerRadiusFactor = PI / 7;
  float innerRadius = outerRadius * innerRadiusFactor;
  float outerRadiusRatio = outerRadius / steps;
  float innerRadiusRatio = innerRadius / steps;
  float shadeRatio = 255.0 / steps;
  float rotationRatio = 120 / steps;
  
  simpleMandala(
    PVector center,
    int pointCount,
    int steps,
    float outerRadius,
    float innerRadiusFactor,
    float innerRadius,
    float outerRadiusRatio,
    float innerRadiusRatio,
    float shadeRatio,
    float rotationRatio
  ) {
    this.center = center;
    this.pointCount = pointCount;
    this.steps = steps;
    this.outerRadius = outerRadius;
    this.innerRadiusFactor = innerRadiusFactor; 
    this.innerRadius = innerRadius;
    this.outerRadiusRatio = outerRadiusRatio; 
    this.innerRadiusRatio = innerRadiusRatio;
    this.shadeRatio = shadeRatio;
    this.rotationRatio = rotationRatio;
  }
  
  simpleMandala() {    
    PVector center = new PVector(random(width), random(height));
    int pointCount = int(random(3, 32));
    int steps = int(random(25, 75));
    
    float outerRadius = width * .5;
    float innerRadiusFactor = PI / 7;
    float innerRadius = outerRadius * innerRadiusFactor;
    float outerRadiusRatio = outerRadius / steps;
    float innerRadiusRatio = innerRadius / steps;
    float shadeRatio = 255.0 / steps;
    float rotationRatio = 120 / steps;

    this.center = center;
    this.pointCount = pointCount;
    this.steps = steps;
    this.outerRadius = outerRadius;
    this.innerRadiusFactor = innerRadiusFactor; 
    this.innerRadius = innerRadius;
    this.outerRadiusRatio = outerRadiusRatio; 
    this.innerRadiusRatio = innerRadiusRatio;
    this.shadeRatio = shadeRatio;
    this.rotationRatio = rotationRatio;
  }
  
  void display() {
    pushMatrix();
    translate(
      this.center.x + this.outerRadius, 
      this.center.y + this.outerRadius
    );
    
    for (int i = 0; i < this.steps; i++) {
      stroke(255 - this.shadeRatio * i, 100);
      fill(this.shadeRatio * i);
      pushMatrix();
      rotate(this.rotationRatio * i * PI / 180);
      
      star(this.pointCount, this.outerRadius - this.outerRadiusRatio * i, this.innerRadius - this.innerRadiusRatio * i);
      popMatrix();
    }
    
    popMatrix();
  }
  
  void move() {
      pushMatrix();
      rotate(this.rotationRatio + this.rotationRatio * PI / 180);
      popMatrix();
  }
  
}
