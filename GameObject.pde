abstract class GameObject
{
  PVector pos;
  float radius;
  
  GameObject()
  {
  }
  
  abstract void render();
  abstract void update();
}