class Player extends GameObject
{  
  PShape shape;
  PVector pos;
  char up,down,left,right,shoot,bomb;
  int health;
  int ammo;
  
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
    shape.vertex(pos.x,pos.y);
    shape.vertex(pos.x - radius, pos.y - radius);
    shape.vertex(pos.x + radius, pos.y);
    shape.vertex(pos.x - radius, pos.y + radius);
    shape.endShape(CLOSE);
  }
  
  void render()
  {
    text("Health: " + health, 30, 30);
    text("Ammo: " + ammo, 30, 20);
    shape(shape,pos.x,pos.y);
  }
  
  void update()
  {
    if (checkKey(up))
    {
      pos.y-=5;    
    }
    if (checkKey(down))
    {
      pos.y +=5;
    }
    if(checkKey(left))
    {
      pos.x-=5;
    }
    if(checkKey(right))
    {
      pos.x+=5;
    }
  }
}