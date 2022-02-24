public class Obstacle{
  int x;
  int y;
  String name;
  PImage pi;
  
  public Obstacle(String n, int ex, int wy){
    x = ex;
    y = wy;
    name = n;
    pi = loadImage(name + ".png");
  }
  
  public void show(){
    image(pi, 50*x - 25 + 50*changeX, 50*y - 50 + 50*changeY, 100, 100);
  }
}
