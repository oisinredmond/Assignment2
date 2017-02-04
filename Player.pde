class Player extends GameObject
{  
  PShape shape;
  char up,down,left,right,shoot,bomb;
  int health;
  int ammo;
  
  float fireRate = 10;
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
    this.health = 100;
    this.ammo = 50;
    this.radius = radius;
    create();
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
    shape.stroke(255);
    shape.noFill();
    shape.strokeWeight(2);
    shape.vertex(pos.x,pos.y);
    shape.vertex(pos.x - radius, pos.y - radius);
    shape.vertex(pos.x + radius, pos.y);
    shape.vertex(pos.x - radius, pos.y + radius);
    shape.endShape(CLOSE);
  }
  
  void render()
  {
    fill(255);
    stroke(255);
    rectMode(CORNER);
    text("Health: ", 30, 30);
    text("Score: ",30,50);
    fill(0,255,0);
    rect(80,20,health*1.5,10);
    
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
      pos.y-=7;    
    }
    if (checkKey(down))
    {
      pos.y +=7;
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