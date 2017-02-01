class Bullet extends GameObject
{
  float size;
  float speed = 200;
  PVector posb;
  float timeToLive;
  float alive;
  
  Bullet(float x, float y, float size, float timeToLive)
  {
    posb = new PVector(x,y);
    this.size = size;
    this.timeToLive = timeToLive;    
    this.alive = 0;
  }
  
  void render()
  {
    pushMatrix();
    translate(posb.x,posb.y);
    stroke(255);
    line(100,0,100+size,0);
    popMatrix();
  }
  
  void update()
  {
    posb.x += 10;
    
    alive += timeDelta;
    if (alive > timeToLive)
    {
      gameObjects.remove(this);
    }    
  }
}