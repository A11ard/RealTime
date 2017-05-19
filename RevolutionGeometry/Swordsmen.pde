class Swordsmen{
  public int life;
  int speed;
  int attack;
  public int x;
  int y;
  boolean team; //true = player team, false = computer

  public Swordsmen(boolean team){
    life = 100;
    attack = 10;
    if (team){
      x = 10;
      speed = 10;
    }
    else {
      x = 390;
      speed = -10;
    }
    y = 200;
    this.team =team;
  }

  void attack(Swordsmen target){
    target.life -= attack;
  }

  void move(){
    x += speed;
  }

  /**
  draws a swordsman as a 10 by 10 square centered at its (x,y) coordinates.
  */
  void drawUnit(){
    quad(x+5,y+5,x+5,y-5,x-5,y+5,x-5,y-5);
  }
}