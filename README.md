#ASTEROID WARS

An asteroid shooter for OOP assignment 2

#YouTube Video

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/1Hnp1juFaeU/0.jpg)](https://www.youtube.com/watch?v=1Hnp1juFaeU)

# Description
Asteroid wars is a game in which the player controls a spaceship and must shoot oncoming asteroids to survive. The speed and spawn rate of the oncoming asteroids increases with every level.

The player earns points by destroying asteroids. The amount of points awarded is based on the health and size of the asteroid destroyed.

The player can regenerate health by shooting the health pickups, which spawn periodically. The game ends when the player's health reaches zero.


#Controls

* W,A,S, and D keys are used to move the ship.
* SPACEBAR to shoot.

#Functionality

The game uses classes and subclasses to create game objects and adds them to an array list. Every game object in the array list is rendered and updated each frame.

The game will detect collisions between bullets and enemies/health pickups, and applies damage or add health respectively.

The enemy spawn rate and speeed increases with each level. The level will increment every thousand points earned. The speed of the stars will also increase.



Game objects:
*Bullets
*Player
*Enemies
*Health Pickups
*Stars
