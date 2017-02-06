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
int level = 1;
int tmp;
int r;
int boundaryx = 300;
float enemy_x;
float enemy_y;
boolean enemy_dead = false;
boolean explode = false;

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
  stroke(0,0,255);
  line(boundaryx,0,boundaryx,height);
  stroke(255);
  for (int i = gameObjects.size() -1 ; i >= 0  ; i --)
  {
    GameObject go = gameObjects.get(i);
    go.render();    
    go.update();
  }
  
  if(frameCount % 300*(1/level) == 0)
  {
    Enemy e = new Enemy();
    gameObjects.add(e);
  }
  
  if(frameCount % 20 == 0)
  {
    Star s = new Star();
    gameObjects.add(s);
  }
  
  if(enemy_dead)
  {
    text("+" + tmp*10,enemy_x,enemy_y);
    enemy_y--;
  }
  
  if(explode && r < 80)
  {
    ellipseMode(CENTER);
    noFill();
    stroke(255,255,0);
    strokeWeight(2);
    ellipse(enemy_x,enemy_y,r,r);
    r+=2;
    health -= 0.1;
  }
}