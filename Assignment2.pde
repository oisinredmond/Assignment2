void setup()
{
  size(1200,700);
  background(0);
  Player player1 = new Player(25,100,350,'w','s',' ','c');
  gameObjects.add(player1);

}

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

void draw()
{
  for (int i = gameObjects.size() -1 ; i >= 0  ; i --)
  {
    GameObject go = gameObjects.get(i); 
    //go.update();
    go.render();    
  }
}