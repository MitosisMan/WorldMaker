float changeY = 0;
float changeX = 0;
boolean up, down, left, right;
float speed = 1;
Obstacle[][] obs = new Obstacle[10000][10000];
boolean redraw = true;

void setup() {
  size(800, 600);
  background(255);
}

void draw() {
  if (frameCount % 20 == 0)
    println(frameRate);

  if (up) {
    redraw = true;
    changeY += speed;
  }
  if (down) {
    redraw = true;
    changeY -= speed;
  }
  if (right) {
    redraw = true;
    changeX -= speed;
  }
  if (left) {
    redraw = true;
    changeX += speed;
  }
  
  if (mousePressed) {
    redraw = true;
    int x = -1*(int)changeX + (int)mouseX/50;
    int y = -1*(int)changeY + (int)mouseY/50;
    obs[x + 5000][y + 5000] = (new Obstacle("pokemonTree", x, y));
  }
  
  

  if (redraw) {
    background(255);
    fill(0);
    for (int x = -50; x < width; x += 50) {  //Longitude
      line(x + (50*changeX) % 50, 0, x + (50*changeX) % 50, height);
    }
    for (int y = -50; y < height; y += 50) {  //Latitude
      line(0, y + (50*changeY) % 50, width, y + (50*changeY) % 50);
    }

    for (int x = 4999 - (int)changeX; x < 5000 + 1 + width/50 - changeX; x++) {
      for (int y = 4999 - (int)changeY; y < 5000 + 1 + height/50 - changeY; y++) {
        if (obs[x][y] != null)
          obs[x][y].show();
      }
    }
    redraw = false;
  }

  fill(255);
  rect(25, 25, 600, 100);
  fill(0);
  textSize(30);
  text("UP and DOWN arrows to change speed", 45, 60);
  text("Speed is " + speed, 45, 100);
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    up = true;
  }
  if (key == 'a' || key == 'A') {
    left = true;
  }
  if (key == 's' || key == 'S') {
    down = true;
  }
  if (key == 'd' || key == 'D') {
    right = true;
  }
  if (key == CODED) {
    if (keyCode == UP) {
      if (speed < 10)
        speed += .5;
    }
    if (keyCode == DOWN) {
      if (speed > 0)
        speed -= .5;
    }
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') {
    up = false;
  }
  if (key == 'a' || key == 'A') {
    left = false;
  }
  if (key == 's' || key == 'S') {
    down = false;
  }
  if (key == 'd' || key == 'D') {
    right = false;
  }
}
