class Enemy extends GameObject
{
  PShape shape;
  float size;
  float theta;
  float health;
  float rotation;
  float velocity;
  float spawnrate;
  
  Enemy()
  {
    pos = new PVector(1100,random(50,650));
    this.health = random(5,20);
    this.size = health*3;
    theta = 0;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    noFill();
    rotate(theta);
    stroke(255, 0, 0);
    rectMode(CENTER);
    rect(0, 0, size, size);
    popMatrix();
  }
  
  void update()
  {
    theta += 0.1f;
  }
}