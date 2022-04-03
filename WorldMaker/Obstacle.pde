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
    if(name.equals("pokemonTree"))
      image(pi, 50*x - 25 + 50*changeX, 50*y - 50 + 50*changeY, 100, 100);
    else
      image(pi, 50*x + 50*changeX, 50*y + 50*changeY, 50, 50);
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
    return name + " " + x + " " + y;
  }
}
