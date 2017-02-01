class Player extends GameObject
{  
  PShape shape;
  PVector posp;
  char up,down,left,right,shoot,bomb;
  int health;
  int ammo;
  
  float fireRate = 10;
  float toPass = 1.0 / fireRate;
  float elapsed = toPass;
  
  Player(float radius,float x, float y, char up,char down, char left, char right, char shoot, char bomb)
  {
    posp = new PVector(x, y);
    this.radius = radius;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.shoot = shoot;
    this.bomb = bomb;
    this.health = 10;
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
    shape.vertex(posp.x,posp.y);
    shape.vertex(posp.x - radius, posp.y - radius);
    shape.vertex(posp.x + radius, posp.y);
    shape.vertex(posp.x - radius, posp.y + radius);
    shape.endShape(CLOSE);
  }
  
  void render()
  {
    text("Health: " + health, 30, 30);
    text("Ammo: " + ammo, 30, 20);
    
    pushMatrix();
    translate(posp.x,posp.y);
    shape(shape,0,-350);
    popMatrix();
  }
  
  void update()
  {
    if (checkKey(shoot) && elapsed > toPass)
    {
      PVector bp = new PVector(posp.x,posp.y);
      Bullet b = new Bullet(bp.x, bp.y, 5, 20);
      gameObjects.add(b);
      elapsed = 0;
      ammo --;
    }
    
    elapsed += timeDelta;
    
    if (checkKey(up))
    {
      posp.y-=7;    
    }
    if (checkKey(down))
    {
      posp.y +=7;
    }
    if(checkKey(left))
    {
      posp.x-=7;
    }
    if(checkKey(right))
    {
      posp.x+=7;
    }
  }
}