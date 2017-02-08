class Health extends GameObject
{
  float radius;
  PShape shape;
  Health()
  {
    this.pos = new PVector(width + 50,random(50,height-50));
    this.radius = 40;
  }
  
  void render()
  {
     ellipseMode(CENTER);
     stroke(0,255,0);
     noFill();
     ellipse(pos.x,pos.y,radius,radius);
     rectMode(CENTER);
     fill(0,255,0);
     rect(pos.x,pos.y,radius/6,radius/2);
     rect(pos.x,pos.y,radius/2,radius/6);
  }
  
  void update()
  {
    pos.x --;
    for(int i = 0 ; i < gameObjects.size() ; i ++)
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Player)
      {
        Player p = (Player) go;
        if(dist(go.pos.x, go.pos.y, this.pos.x, this.pos.y) < p.radius)
        {
          health += 5;
          gameObjects.remove(this);
        }
      }
    }
  }
}