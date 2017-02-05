class Star extends GameObject
{
  Star()
  {
    pos = new PVector(width + 20,random(10,height-10));
  }
  
  void render()
  {
    stroke(255);
    ellipse(pos.x,pos.y,1,1);
  }
  
  void update()
  {
    pos.x--;
    if(pos.x < 0)
    {
      gameObjects.remove(this);
    }
  }
}