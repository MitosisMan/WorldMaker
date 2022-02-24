public class Obstacle{
  int x;
  int y;
  String name;
  PImage pi;
  boolean physical;
  
  public Obstacle(String n, int ex, int wy, boolean b){
    x = ex;
    y = wy;
    name = n;
    pi = loadImage(name + ".png");
    physical = b;
  }
  
  public void show(){
    image(pi, 50*x - 25 + 50*changeX, 50*y - 50 + 50*changeY, 100, 100);
  }
  
  public int getX(){
    return x;
  }
  
  public int getY(){
    return y;
  }
  
  public String getName(){
    return name;
  }
  
  public String toString(){
    return name + " " + x + " " + y + " " + physical;
  }
}
