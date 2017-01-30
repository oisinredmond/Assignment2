class Bullet extends GameObject
{
  float size;
  float speed = 200;
  float timeToLive;
  float alive;
  
  Bullet(float x, float y, float theta, float size, float timeToLive)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, 1);
    this.size = size;
    this.timeToLive = timeToLive;    
    this.alive = 0;
  }
  
  void render()
  {
  }
  
  void update()
  {
  }
}