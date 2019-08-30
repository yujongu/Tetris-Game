import java.util.*;
ArrayList<PVector> tet;
Queue<ArrayList<PVector>> queue;
ArrayList<PVector> curr;
int[][] result;

float drop = pixelSize;
boolean curEmpty = true;
int frame = 0;

int gameSpeed = 60;
class Blocks {
  Blocks() {
    tet = new ArrayList<PVector>();
    queue = new LinkedList<ArrayList<PVector>>();
    curr = new ArrayList<PVector>();
    result = new int[(int) (400/pixelSize)][(int) (400/pixelSize)];

    for (int i = 0; i < 400/pixelSize; i++) {
      for (int j = 0; j < 400/pixelSize; j++) {
        result[i][j] = 0;
      }
    }

    randGen();
  }

  void gameplay() {
    if (curEmpty == true) {//moves the block from queue into gameField(curr)
      curr = queue.peek();
      queue.remove();
      randGen();
      curEmpty = false;
    }

    drawBlock();

    checkBottom();
    drawBase();
    //check when the block hits the bottom
  }

  void checkBottom() {
    for (int i = 0; i < 400 / pixelSize; i++) {
      for (int j = 0; j < 400 / pixelSize; j++) {
        if (curr.get(3).y == 400 ||
          result[(int)(curr.get(0).x / pixelSize)][(int)(curr.get(0).y / pixelSize)] == 1 ||
          result[(int)(curr.get(1).x / pixelSize)][(int)(curr.get(1).y / pixelSize)] == 1 ||
          result[(int)(curr.get(2).x / pixelSize)][(int)(curr.get(2).y / pixelSize)] == 1 ||
          result[(int)(curr.get(3).x / pixelSize)][(int)(curr.get(3).y / pixelSize)] == 1
          ) {

          curEmpty = true;
          result[(int)(curr.get(0).x/pixelSize)][(int)(curr.get(0).y/pixelSize) - 1] = 1;
          result[(int)(curr.get(1).x/pixelSize)][(int)(curr.get(1).y/pixelSize) - 1] = 1;
          result[(int)(curr.get(2).x/pixelSize)][(int)(curr.get(2).y/pixelSize) - 1] = 1;
          result[(int)(curr.get(3).x/pixelSize)][(int)(curr.get(3).y/pixelSize) - 1] = 1;
        }
      }
    }
  }

  void drawBlock() {
    for (int i = 0; i < 4; i++) {
      fill(255);
      stroke(0); 
      rect(curr.get(i).x, curr.get(i).y, pixelSize, pixelSize, 3);
    }
    frame++;
    if (frame > gameSpeed) {
      for (int i = 0; i < 4; i++) {
        curr.get(i).y += pixelSize;
      }
      frame = 0;
    }
  }

  void drawBase() {
    for (int i = 0; i < 400/pixelSize; i++) {
      for (int j = 0; j < 400/pixelSize; j++) {
        if (result[i][j] == 1) {
          rect(i * pixelSize, j * pixelSize, pixelSize, pixelSize, 3);
        }
      }
    }
  }












  void randGen() { //adds the block into queue
    int type = (int) random(0, 7);
    tet = new ArrayList<PVector>();
    switch(type) {
    case 0:
      dSquare();
      break;
    case 1:
      dZed();
      break;
    case 2:
      dZedRev();
      break;
    case 3:
      dLong();
      break;
    case 4:
      dBent();
      break;
    case 5:
      dBentRev();
      break;
    case 6:
      dMid();
      break;
    default:
      dLong();
      break;
    }
  }

  void dSquare() {
    tet.add(new PVector(200 - pixelSize, 0));
    tet.add(new PVector(tet.get(0).x + pixelSize, tet.get(0).y));
    tet.add(new PVector(tet.get(0).x, tet.get(0).y + pixelSize));
    tet.add(new PVector(tet.get(0).x + pixelSize, tet.get(0).y + pixelSize));
    queue.add(tet);
  }
  void dZed() {
    tet.add(new PVector(200 - pixelSize, 0));
    tet.add(new PVector(tet.get(0).x + pixelSize, tet.get(0).y));
    tet.add(new PVector(tet.get(0).x + pixelSize, tet.get(0).y + pixelSize));
    tet.add(new PVector(tet.get(0).x + pixelSize * 2, tet.get(0).y + pixelSize));
    queue.add(tet);
  }
  void dZedRev() {
    tet.add(new PVector(200 - pixelSize, 0));
    tet.add(new PVector(tet.get(0).x + pixelSize, tet.get(0).y));
    tet.add(new PVector(tet.get(0).x, tet.get(0).y + pixelSize));
    tet.add(new PVector(tet.get(0).x - pixelSize, tet.get(0).y + pixelSize));
    queue.add(tet);
  }
  void dLong() {
    tet.add(new PVector(200 - pixelSize, 0));
    tet.add(new PVector(tet.get(0).x + pixelSize, tet.get(0).y));
    tet.add(new PVector(tet.get(0).x + pixelSize * 2, tet.get(0).y));
    tet.add(new PVector(tet.get(0).x + pixelSize * 3, tet.get(0).y));
    queue.add(tet);
  }
  void dBent() {
    tet.add(new PVector(200 - pixelSize, 0));
    tet.add(new PVector(tet.get(0).x + pixelSize, tet.get(0).y));
    tet.add(new PVector(tet.get(0).x + pixelSize * 2, tet.get(0).y));
    tet.add(new PVector(tet.get(0).x + pixelSize * 2, tet.get(0).y + pixelSize));
    queue.add(tet);
  }
  void dBentRev() {
    tet.add(new PVector(200 - pixelSize, 0));
    tet.add(new PVector(tet.get(0).x + pixelSize, tet.get(0).y));
    tet.add(new PVector(tet.get(0).x + pixelSize * 2, tet.get(0).y));
    tet.add(new PVector(tet.get(0).x, tet.get(0).y + pixelSize));
    queue.add(tet);
  }
  void dMid() {
    tet.add(new PVector(200 - pixelSize, 0));
    tet.add(new PVector(tet.get(0).x + pixelSize, tet.get(0).y));
    tet.add(new PVector(tet.get(0).x + pixelSize * 2, tet.get(0).y));
    tet.add(new PVector(tet.get(0).x + pixelSize, tet.get(0).y + pixelSize));
    queue.add(tet);
  }

  void move(int direction) {
    switch (direction) {
    case DOWN:
      for (int i = 0; i < 4; i++) {
        curr.get(i).y += drop;
      }
      break;
    case LEFT:
      if (result[(int)((curr.get(0).x - drop)/pixelSize)][(int)((curr.get(0).y)/pixelSize)] != 1 &&
        result[(int)((curr.get(1).x - drop)/pixelSize)][(int)((curr.get(1).y)/pixelSize)] != 1 &&
        result[(int)((curr.get(2).x - drop)/pixelSize)][(int)((curr.get(2).y)/pixelSize)] != 1 &&
        result[(int)((curr.get(3).x - drop)/pixelSize)][(int)((curr.get(3).y)/pixelSize)] != 1) {
        for (int i = 0; i < 4; i++) {
          curr.get(i).x -= drop;
        }
      }

      break;
    case RIGHT:
      if (result[(int)((curr.get(0).x + drop)/pixelSize)][(int)((curr.get(0).y)/pixelSize)] != 1 &&
        result[(int)((curr.get(1).x + drop)/pixelSize)][(int)((curr.get(1).y)/pixelSize)] != 1 &&
        result[(int)((curr.get(2).x + drop)/pixelSize)][(int)((curr.get(2).y)/pixelSize)] != 1 &&
        result[(int)((curr.get(3).x + drop)/pixelSize)][(int)((curr.get(3).y)/pixelSize)] != 1) {
        for (int i = 0; i < 4; i++) {
          curr.get(i).x += drop;
        }
      }
      break;
    case UP:
      for (int i = 0; i < 4; i++) {
        float hold = curr.get(i).x;
        curr.get(i).x = curr.get(i).y;
        curr.get(i).y = 400 - hold;
      }
      break;
    default:
      for (int i = 0; i < 4; i++) {
        curr.get(i).y += drop;
      }
      break;
    }
  }
}
