class Nexus extends Unit{
  
  Nexus(boolean _team){
    /******************
      100 is the menuH, height/2 is the maximum height the units will spawn, 20 is so it won't touch menu
      super(int _life, float _speed, int _damage, int _trainingTime, boolean _team, int _y)
    ******************/
    super(1000,0.8,2,2,_team,0);
    if(_team == true){
      position = new PVector(0, height/2 + 50); //Spawns unit on the player field
    }
    else{
      position = new PVector(width - 100, height/2 + 50); //Spawns unit on the enemy field
    }
  }
  
  int identifier(){
    return 10; 
  }
  void attack(Unit target){
   return;
  }
  
  
  void drawUnit(){
    stroke(0);
    noFill();
    rect(position.x,position.y,100,100);
  }  
  
    
  void updateHealth(){
    fill(0,255,0);
    float lifebar = 100.0;
    int size = 3;
    rect(position.x, position.y - 5,lifebar,size);
    //Updating health requires this, when you get attacked, creates a new rect that decreases health bar 
    fill(255,0,0);
    rect(position.x + lifebar,position.y - 5,life/(lifeinit/lifebar) - lifebar,size);
  }
   
}