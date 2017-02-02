class Enemy extends GameObject
{
  PShape shape;
  float size;
  float health;
  float rotation;
  float velocity;
  float spawnrate;
  
  Enemy()
  {
    pos = new PVector(1100,random(50,650));
    this.health = random(5,20);
    this.size = health*3;
    create();
  }
  
  void create()
  {
    shape = createShape();
    shape.beginShape();
    shape.stroke(255,0,0);
    shape.noFill();
    shape.vertex(pos.x,pos.y);
    shape.vertex(pos.x + size, pos.y);
    shape.vertex(pos.x + size, pos.y + size);
    shape.vertex(pos.x,pos.y+size);
    shape.endShape(CLOSE);
  }
  
  void render()
  {
    shape(shape,0,0);
  }
  
  void update()
  {
  }
}