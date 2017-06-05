class Swordsmen extends Unit{
  //int lifeinit;
  static final int COST = 5;

  
  Swordsmen(boolean _team){
    /******************
      100 is the menuH, height/2 is the maximum height the units will spawn, 20 is so it won't touch menu
    super(int _life, float _speed, in  t _damage, int _trainingTime, boolean _team, int _y)
    ******************/
    super(100,1.0,10,2,_team, (int)random(height - 80 - (height/2) - 20));
    if(_team == true){
      position = new PVector(50, height/2 + y); //Spawns unit on the player field
    }
    else{
      position = new PVector(width - 50, height/2 + y); //Spawns unit on the enemy field
    }
    //lifeinit = life;
    attackRange = 15;
  }



  int identifier(){
    return 0;
  }
  
  
  /**
  draws a swordsman as a 10 by 10 square centered at its (x,y) coordinates.
  */
  void drawUnit(){
    stroke(0);
    if(team == true){
      fill(0, 0, 255);
    }
    else{
      fill(255,0,0);  
    }
    rect(position.x+5,position.y,10,10);
    
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