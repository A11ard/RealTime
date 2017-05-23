class Swordsmen extends Unit{
  
  Swordsmen(boolean _team){
    //100 is the menuH, height/2 is the maximum height the units will spawn, 20 is so it won't touch menu
    //super(int _life, float _speed, int _damage, int _trainingTime, int _cost, boolean _team, int _y)
    super(100,1.0,10,2,5,_team, (int)random(height - 80 - (height/2) - 20));
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
  
  //Leo, your move isn't finished
  /*
    void move(Unit target){
    if(target == null){ //no target, then move foward
      if (team){
        position.x += speed;
      }
      else {
        position.x -= speed;
      }
    }
    else{//there is a target, move towards it.
      
    }
  }
  */
  
  int identifier(){
    return 0;
  }
  
  
  /**
  draws a swordsman as a 10 by 10 square centered at its (x,y) coordinates.
  */
  void drawUnit(){
    stroke(0);
    rect(position.x+5,position.y,10,10);
  }
  void updateHealth(){
    fill(0,255,0);
    //Warrior has 100 health
    int lifebar = 20;
    int size = 3;
    rect(position.x, position.y - 5,lifebar,size);
    //Updating health requires this, when you get attacked, creates a new rect that decreases health bar
    int healthUpdate = 0; 
    fill(255,0,0);
    rect(position.x + lifebar,position.y - 5,healthUpdate,size);
  }
}