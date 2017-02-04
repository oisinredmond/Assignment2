class Enemy extends GameObject
{
  PShape shape;
  float size;
  float theta;
  int health;
  int tmp;
  float rotation;
  float velocity;
  float spawnrate;
  
  Enemy()
  {
    pos = new PVector(1100,random(50,650));
    this.health = int(random(5,20));
    this.size = health*3;
    this.tmp = health;
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
    theta += random(0.04f,0.1f);
    pos.x -= random(1,2);

    if(this.health <= 0)
    {
      gameObjects.remove(this);
      score += tmp*10;
    }
  }
  
  void damaged()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    noFill();
    rotate(theta);
    stroke(255, 0, 0);
    rectMode(CENTER);
    rect(0, 0, size + 10, size + 10);
    popMatrix();
  }
}