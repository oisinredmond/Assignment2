void setup()
{
  size(1000,700);
  background(0);
}

Player player1 = new Player(100,350,30,'w','s',' ','c');

void draw()
{
  player1.create();
  player1.render();
}