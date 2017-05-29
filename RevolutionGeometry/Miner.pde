class Miner extends Unit{
  int lifeinit;
  static final int COST = 10;
  int direction = 0;
  
  Miner(boolean _team){
    //100 is the menuH, height/2 is the maximum height the units will spawn, 20 is so it won't touch menu
    //super(int _life, float _speed, int _damage, int _trainingTime, boolean _team, int _y)
    super(100,0.8,2,2,_team,0);
    if(_team == true){
      position = new PVector(50, height/2 + 100);
    }
    else{
      position = new PVector(width - 50, height/2 + 100);
    }
    lifeinit = life;
    attackRange = 0;
  }
  
  int identifier(){
    return 4; 
  }
  
  void drawUnit(){
    stroke(0);
    fill(0);
    rect(position.x+5,position.y,10,10);
  }   
  
  void attack(Unit target){
    if(direction == 0){
      position.y -= speed;
      if(position.y <= height/2 + 100){
        direction = 1;
      }
    } 
    else{
      position.y += speed;
      if(position.y >= height - 100){
        direction = 0;
      }
    }
      
    
  }
/*
  void updateHealth(){
    fill(0,255,0);
    int lifebar = 20;
    int size = 3;
    rect(position.x - 5, position.y - 12,lifebar,size);
    //Updating health requires this, when you get attacked, creates a new rect that decreases health bar 
    fill(255,0,0);
    rect(position.x + lifebar - 5,position.y - 12,life/(lifeinit/lifebar) - lifebar,size);
  } 
  */
  

  
}