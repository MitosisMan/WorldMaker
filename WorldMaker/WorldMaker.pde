float changeY = 0;
float changeX = 0;
boolean up, down, left, right;
float speed = 1;
Obstacle[][] obs = new Obstacle[10000][10000];
boolean redraw = true;
PrintWriter output;

void setup() {
  size(800, 600);
  background(255);
}

void draw() {
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
    obs[x + 5000][y + 5000] = (new Obstacle("pokemonTree", x, y, true));
  }



  if (redraw) {
    background(255);
    
    fill(200,100,100);
    square(50*changeX,50*changeY,50);
    
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

    fill(255);
    rect(25, 25, 600, 100);
    fill(0);
    textSize(30);
    text("UP and DOWN arrows to change speed", 45, 60);
    text("Speed is " + speed, 45, 100);

    redraw = false;
  }
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
  if (key == 'o' || key == 'O') {
    save();
  }
  if (key == 'p' || key == 'P') {
    load();
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

public void save() {
  output = createWriter("pokemonWorld.txt");
  for (Obstacle[] row : obs) {
    for (Obstacle o : row) {
      if (o != null)
        output.println(o);
    }
  }
  output.println();
  output.flush();
  output.close();
  println("saved");
}

public void load() {
  obs = new Obstacle[10000][10000];
  BufferedReader reader = createReader("pokemonWorld.txt");
  String line = null;
  try {
    while ((line = reader.readLine()) != null) {
      String[] pieces = line.split(" ");
      if (pieces.length > 1) {
        String name = pieces[0];
        int x = int(pieces[1]);
        int y = int(pieces[2]);
        obs[x+5000][y+5000] = new Obstacle(name, x, y, true);
      }
    }
    reader.close();
  } 
  catch (IOException e) {
  }
  redraw = true;
  println("loaded");
}
