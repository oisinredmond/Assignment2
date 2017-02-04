class Bullet extends GameObject
{
  float size;
  float speed = 200;
  PVector pos;
  float timeToLive;
  float alive;
  
  Bullet(float x, float y, float size, float timeToLive)
  {
    pos = new PVector(x,y);
    this.size = size;
    this.timeToLive = timeToLive;    
    this.alive = 0;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    stroke(255);
    line(100,0,100+size,0);
    popMatrix();
  }
  
  void update()
  {
    pos.x += 10;
    
    alive += timeDelta;
    if (alive > timeToLive)
    {
      gameObjects.remove(this);
    }
    
    for(int i = 0 ; i < gameObjects.size() ; i ++)
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Enemy)
      {
        Enemy e = (Enemy) go;
        if(dist(go.pos.x, go.pos.y, this.pos.x, this.pos.y) < e.size)
        {
          e.health -=2;
          gameObjects.remove(this);
          
        }
      }
    }
  }
}