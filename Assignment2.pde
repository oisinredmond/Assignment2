void setup()
{
  size(1200,700);
  background(0);
  Player player1 = new Player(25,100,350,'w','s','a','d',' ','c');
  gameObjects.add(player1);
}

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
boolean[] keys = new boolean[1000];

float timeDelta = 1.0f / 60.0f;
int score = 0;
float health = 100;
float spawnrate;
float fireRate = 6;
int level = 1;
int tmp;
int boundaryx = 300;
float enemy_x;
float enemy_y;
boolean enemy_dead = false;
boolean explode = false;
boolean start = false;

void keyPressed()
{ 
  keys[keyCode] = true;
}
 
void keyReleased()
{
  keys[keyCode] = false; 
}

boolean checkKey(int k)
{
  if (keys.length >= k) 
  {
    return keys[k] || keys[Character.toUpperCase(k)];  
  }
  return false;
}

void draw()
{
  background(0);
  
  while(health > 0 && start == true)
  {
    stroke(0,0,255);
    line(boundaryx,0,boundaryx,height);
    stroke(255);
    for (int i = gameObjects.size() -1 ; i >= 0  ; i --)
    {
      GameObject go = gameObjects.get(i);
      go.render();    
      go.update();
    }
    
    if(level != 1)
    {
      spawnrate = (400/(level))*2;
    }
    else
    {
      spawnrate = 300;
    }
    
    if(frameCount % random(spawnrate, spawnrate/2) == 0)
    {
      Enemy e = new Enemy();
      gameObjects.add(e);
    }
    
    if(frameCount % 20 == 0)
    {
      Star s = new Star();
      gameObjects.add(s);
    }
    
    if(frameCount % 1400 == 0)
    {
        Health h = new Health();
        gameObjects.add(h);
    }
    
    if(enemy_dead)
    {
      text("+" + tmp*10,enemy_x,enemy_y);
      enemy_y--;
    }
  }
  fill(255);
  rect(width/2 - 150,height/2 - 50,300,100);
  textSize(70);
  fill(0);
  strokeWeight(3);
  text("START", width/2 - 110,height/2 + 30);
  fill(255,0,0);
  text("ASTEROID WARS",width/2 - 250, height/2 - 200);
  
}