class Miner extends Unit{
  int lifeinit;
  static final int COST = 5;
  
  Miner(boolean _team){
    //100 is the menuH, height/2 is the maximum height the units will spawn, 20 is so it won't touch menu
    //super(int _life, float _speed, int _damage, int _trainingTime, int _cost, boolean _team, int _y)
    super(100,1.0,2,2,_team, (int)random(height - 80 - (height/2) - 20), true);
    if(_team == true){
      position = new PVector(50, height/2 + y);
    }
    else{
      position = new PVector(width - 50, height/2 + y);
    }
    lifeinit = life;
    attackRange = 0;
  }
  
  int identifier(){
    return 1; 
  }
  
  void drawUnit(){
    stroke(0);
    rect(position.x+5,position.y,10,10);
  }   

  void updateHealth(){
    fill(0,255,0);
    //Miner has 100 health
    int lifebar = 20;
    int size = 3;
    rect(position.x, position.y - 5,lifebar,size);
    //Updating health requires this, when you get attacked, creates a new rect that decreases health bar 
    fill(255,0,0);
    rect(position.x + lifebar,position.y - 5,life/(lifeinit/lifebar) - lifebar,size);
  }  
  
  void attack(Unit target){//miners dont actively seek to attack enemies
  }
  
}
