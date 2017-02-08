class Player extends GameObject
{  
  PShape shape;
  char up,down,left,right,shoot,bomb;
  int ammo;
  
  float fireRate = 6;
  float toPass = 1.0 / fireRate;
  float elapsed = toPass;
  
  Player(float radius,float x, float y, char up,char down, char left, char right, char shoot, char bomb)
  {
    pos = new PVector(x, y);
    this.radius = radius;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.shoot = shoot;
    this.bomb = bomb;
    this.ammo = 50;
    this.radius = radius;
    create();
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
    shape.stroke(255);
    shape.fill(100);
    shape.strokeWeight(1);
    shape.vertex(pos.x - radius/2, pos.y - (radius/2) + 5);
    shape.vertex(pos.x - radius,pos.y - radius);
    shape.vertex(pos.x + radius, pos.y - ((radius/2) - 7));
    shape.vertex(pos.x + radius/2,pos.y - ((radius/2) - 7));
    shape.vertex(pos.x + radius/2, pos.y + (radius/2) - 7);
    shape.vertex(pos.x + radius, pos.y + (radius/2) - 7);
    shape.vertex(pos.x - radius,pos.y + radius);
    shape.vertex(pos.x - radius/2, pos.y + (radius/2) - 5);
    shape.endShape(CLOSE);
  }
  
  void render()
  {
    fill(255);
    stroke(255);
    rectMode(CORNER);
    text("Health: ", 20, 30);
    text(health, 220, 30);
    text("Score: " + score,20,50);
    text("Level: " + level,20,70);
    fill(0,255,0);
    rect(70,20,health*1.5,10);
    
    pushMatrix();
    translate(pos.x,pos.y);
    shape(shape,0,-350);
    popMatrix();
  }
  
  void update()
  {
    if (checkKey(shoot) && elapsed > toPass)
    {
      PVector bp = new PVector(pos.x,pos.y);
      Bullet b = new Bullet(bp.x, bp.y, 5, 20);
      gameObjects.add(b);
      elapsed = 0;
      ammo --;
    }
    
    elapsed += timeDelta;
    
    if (checkKey(up))
    {
      pos.y-=8;    
    }
    if (checkKey(down))
    {
      pos.y +=8;
    }
    if(checkKey(left))
    {
      pos.x-=7;
    }
    if(checkKey(right))
    {
      pos.x+=7;
    }
  }
}