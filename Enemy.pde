class Enemy extends GameObject
{
  PShape shape;
  float size;
  float theta;
  int health;
  int temp;
  float rotation;
  float spawnrate;
  int x = 10;
  int y = 10;
  
  Enemy()
  {
    pos = new PVector(1100,random(50,650));
    this.health = int(random(5,20));
    this.size = health*3;
    this.temp = health;
    theta = 0;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    noFill();
    rotate(theta);
    stroke(255, 0, 0);
    strokeWeight(2);
    rectMode(CENTER);
    rect(0, 0, size, size);
    popMatrix();
  }
  
  void update()
  {
    theta += random(0.04f,0.1f);
    pos.x -= random(1,2);
    if(health <= 0)
    {
      score += tmp*10;
      tmp = temp;
      enemy_dead = true;
      enemy_x = pos.x;
      enemy_y = pos.y;
      gameObjects.remove(this);
    }
    if(pos.x < boundaryx)
    {
      explode = true;
      enemy_x = pos.x;
      enemy_y = pos.y;
      r = 10;
      explode = false;
      health -= 0.1;
      gameObjects.remove(this);
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