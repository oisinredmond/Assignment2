class Enemy extends GameObject
{
  PShape shape;
  float size;
  float theta;
  int enemy_health;
  int speed;
  int temp;
  float rotation;
  float spawnrate;
  int x = 10;
  int y = 10;
  
  Enemy()
  {
    pos = new PVector(width + 50,random(50,height-50));
    this.enemy_health = int(random(5,30));
    this.size = enemy_health*3;
    this.speed = level*1;
    this.temp = enemy_health;
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
    
    if(pos.x < boundaryx)
    {
      health -= 5;
      gameObjects.remove(this);
    }
    
    if(enemy_health <= 0)
    {
      tmp = temp;
      enemy_x = pos.x;
      enemy_y = pos.y;
      for(int i = 0; i < tmp*10; i++)
      {
        score ++;
        if(score % 2000 == 0)
        {
          level++;
        }
      }
      enemy_dead = true;
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