abstract class GameObject
{
  PVector pos;
  PVector forward;
  float radius;
  
  GameObject()
  {
    println("In GameObject default constructor.");
  }
  
  abstract void render();
}