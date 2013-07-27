void setup() {
  size(800, 800);
  background(0);
  noStroke();
  
  int rows = 10;
  int cols = 10;
  int row, col;
  int count = rows * cols;
  float mandalaWidth = width / cols;
  float mandalaHeight = height / rows;
  
  simpleMandala [] mandalas;
  
  mandalas = new simpleMandala[count];
  for (int i = 0; i < count; i++) {
    row = floor(i / rows);
    col = i % cols;
    
    mandalas[i] = new simpleMandala(
      new PVector(row * mandalaWidth, col * mandalaHeight),
      int(random(5, 50)),
      int(random(5, 50)),
      mandalaWidth / 2,
      random(0.3, 0.7),
      random(mandalaWidth / rows, mandalaWidth / 2),
      random((row + 1)/(col + 1)),
      random((col + 1)/(row + 1)),
      random(10, 50),
      random((col + row + 1)/((row + 1) * (col + 1)))
    );
    
    mandalas[i].display();
  }
}

void draw() {
//  for (int i = 0; i < count; i++) {
//    mandalas[i].move();
//  }
}
