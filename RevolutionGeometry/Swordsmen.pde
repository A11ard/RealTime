class Swordsmen extends Unit{
  public Swordsmen(boolean _team){
    super(100,1.0,10,2,5,_team, (int)random(75));
    if(_team == true){
      position = new PVector(50, height/2 + y);
    }
    else{
      position = new PVector(width - 50, height/2 + y);
    }
    
  }

 

  void attack(Unit target){
    target.life -= damage;
    
  }

  void move(){
    if (team){
      position.x += speed;
    }
    else {
      position.x -= speed;
    }
  }

  /**
  draws a swordsman as a 10 by 10 square centered at its (x,y) coordinates.
  */
  void drawUnit(){
    stroke(255);
    rect(position.x+5,position.y,10,10);
  }
}