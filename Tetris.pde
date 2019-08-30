float pixelSize = 20;
Blocks block = new Blocks();
void setup(){
  size(400, 400);
}

void draw(){
  background(0);
  stroke(255);
  noFill();
  block.gameplay();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN) {
      block.move(DOWN);
    } else if (keyCode == LEFT) {
      block.move(LEFT);
    } else if (keyCode == RIGHT) {
      block.move(RIGHT);
    } else if (keyCode == UP) {
      block.move(UP);
    }
  }
}
