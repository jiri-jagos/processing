Cell[][] _cellArray;
int _cellSize = 10;
int _numX, _numY;

void setup() {
  size(500, 300);
  _numX = floor(width / _cellSize);
  _numY = floor(height / _cellSize);
  restart();
}

void restart() {
  _cellArray = new Cell[_numX][_numY];
  for(int x = 0; x < _numX; x++) {
    for(int y = 0; y < _numY; y++) {
      Cell newCell = new Cell(x, y);
      _cellArray[x][y] = newCell;
    }
  }
  
  for(int x = 0; x < _numX; x++) {
    for(int y = 0; y < _numY; y++) {
      int above = y - 1;
      int below = y + 1;
      int left = x - 1;
      int right = x + 1;
      
      if (above < 0) {above = _numY - 1;}
      if (below == _numY) {below = 0;}
      if (left < 0) {left = _numX - 1;}
      if (right == _numX) {right = 0;}
      
      _cellArray[x][y].addNeighbor(_cellArray[left][above]);
      _cellArray[x][y].addNeighbor(_cellArray[left][y]);
      _cellArray[x][y].addNeighbor(_cellArray[left][below]);
      _cellArray[x][y].addNeighbor(_cellArray[x][below]);
      _cellArray[x][y].addNeighbor(_cellArray[right][below]);
      _cellArray[x][y].addNeighbor(_cellArray[right][y]);
      _cellArray[x][y].addNeighbor(_cellArray[right][above]);
      _cellArray[x][y].addNeighbor(_cellArray[x][above]);
    }
  }
}

void draw() {
  background(200);
  for(int x = 0; x < _numX; x++) {
    for(int y = 0; y < _numY; y++) {
      _cellArray[x][y].calcNextState();
    }
  }  
  
  translate(_cellSize / 2, _cellSize / 2);
  
  for(int x = 0; x < _numX; x++) {
    for(int y = 0; y < _numY; y++) {
      _cellArray[x][y].drawMe();
    }
  }  
}

void mousePressed() {
  restart();
}

class Cell {
  float x, y;
  boolean state, nextState;
  Cell[] neighbors;
  
  Cell(float ex, float why) {
    x = ex * _cellSize;
    y = why * _cellSize;
    
    nextState = false;
    if (random(2) > 1) {
      nextState = true;
      }
    
    state = nextState;
    neighbors = new Cell[0];
  }
  
  void addNeighbor(Cell cell) {
    neighbors = (Cell[])append(neighbors, cell);
  }
  
  void calcNextState() {
    int liveCount = 0;
    
    if (state) {liveCount++;}
    
    for (int i = 0; i < neighbors.length; i++) {
      if (neighbors[i].state == true) {
        liveCount++;
      }
    }
    
    if (liveCount <= 4) {
      nextState = false;
    } else if (liveCount > 4) {
      nextState = true;
    }
    
    if ((liveCount == 4) || (liveCount == 5)) {
      nextState = !nextState;
    }
  }
  
  void drawMe() {
    state = nextState;
    stroke(0);
    
    fill(0);
    if (state  == true) {
      fill(255);
    }
    
    ellipse(x, y, _cellSize, _cellSize);  
  }
}
