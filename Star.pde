class Star extends GameObject
{
  int speed;
  
  Star()
  {
    pos = new PVector(width + 20,random(10,height-10));
    this.speed = 1*level;
  }
  
  void render()
  {
    stroke(255);
    ellipse(pos.x,pos.y,1,1);
  }
  
  void update()
  {
    pos.x-= speed;
    if(pos.x < 0)
    {
      gameObjects.remove(this);
    }
  }
}