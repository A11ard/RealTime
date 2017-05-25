class Commander extends Unit{
  //int lifeinit;
  static final int COST = 5;

  
  Commander(boolean _team){
    //100 is the menuH, height/2 is the maximum height the units will spawn, 20 is so it won't touch menu
    //super(int _life, float _speed, int _damage, int _trainingTime, boolean _team, int _y)
    super(200,1,30,2,_team, (int)random(height - 80 - (height/2) - 20));
    if(_team == true){
      position = new PVector(50, height/2 + y);
    }
    else{
      position = new PVector(width - 50, height/2 + y);
    }
    //lifeinit = life;
    attackRange = 20;
  }



  int identifier(){
    return 3;
  }
  
void attack(Unit target){
  if(keyPressed){
    if(key == 'w'){
      position.y -= speed;
    }
    else if(key == 'a'){
      position.x -= speed;
    }
    else if(key == 's'){
      position.y += speed;
    }
    else if(key == 'd'){
      position.x += speed;
    }
    else if(key == 'j'){
     if(target == null){ //no target
        return;
      }
     else{
      float distance = position.dist(target.position); //dist from unit to target
      if (attackRange > distance){ //if within range
    
          target.changeLife(damage);
        
      }
     }
    }
  }
}
 
  /**
  draws a swordsman as a 10 by 10 square centered at its (x,y) coordinates.
  */
  void drawUnit(){
    stroke(0);
    fill(0,255,0);;
    rect(position.x + 5,position.y,10,10);
  }
  /*
  void updateHealth(){
    fill(0,255,0);
    float lifebar = 20.0;
    int size = 3;
    rect(position.x, position.y - 5,lifebar,size);
    //Updating health requires this, when you get attacked, creates a new rect that decreases health bar 
    fill(255,0,0);
    rect(position.x + lifebar,position.y - 5,life/(lifeinit/lifebar) - lifebar,size);
  }
  */
}