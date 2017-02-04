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
  stroke(255);  
  for (int i = gameObjects.size() -1 ; i >= 0  ; i --)
  {
    GameObject go = gameObjects.get(i);
    go.render();    
    go.update();
  }
  
  if(frameCount % 120 == 0)
  {
    Enemy e = new Enemy();
    gameObjects.add(e);
  }
}