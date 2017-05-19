class Swordsmen{
  int life;
  int speed;
  int attack;
  int x;
  int y;
  boolean team; //true = player team, false = computer

  public Swordsmen(boolean team){
    life = 100;
    speed = 10;
    attack = 10;
    if (team){
      x = 10;
    }
    else {
      x = 390;
    }
    y = 200;
    this.team =team;
  }

  void attack(Swordsmen target){
    target.life -= attack;
  }

  void move(){
    if (team){
      x += speed;
    }
    else {
      x -= speed;
    }
  }

  /**
  draws a swordsman as a 10 by 10 square centered at its (x,y) coordinates.
  */
  void drawUnit(){
    quad(x+5,y+5,x+5,y-5,x-5,y+5,x-5,y-5);
  }
}