class Enemy extends GameObject
{
  PShape shape;
  float size;
  float theta;
  int enemy_health;
  int temp;
  int speed;
  float rotation;
  float spawnrate;
  int x = 10;
  int y = 10;
  
  Enemy()
  {
    pos = new PVector(width + 50,random(50,height-50));
    this.enemy_health = int(random(5,20));
    this.size = enemy_health*3;
    this.temp = enemy_health;
    this.speed = level*1;
    theta = 0;
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    fill(0);
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
    pos.x -= speed;
    if(enemy_health <=0 && pos.x > boundaryx)
    {
      score += tmp*10*level;
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
      gameObjects.remove(this);
      r = 10;
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