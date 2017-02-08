class RapidFire extends GameObject
{
  float radius;
  RapidFire()
  {
    this.pos = new PVector(width + 50,random(50,height-50));
    this.radius = 40;
  }
  
  void render()
  {
     ellipseMode(CENTER);
     stroke(0,0,255);
     noFill();
     ellipse(pos.x,pos.y,radius,radius);
     rectMode(CENTER);
     fill(0,0,255);
     triangle(pos.x - radius/2,pos.y -radius/ 2,pos.x + radius/2,pos.y,pos.x - radius/2, pos.y + radius/2);
  }
  
  void update()
  {
    pos.x --;
  }
}