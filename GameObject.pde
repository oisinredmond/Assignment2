abstract class GameObject
{
  PVector pos;
  float radius;
  
  GameObject()
  {
    println("In GameObject default constructor.");
  }
  
  abstract void render();
  abstract void update();
}