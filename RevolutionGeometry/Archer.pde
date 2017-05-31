class Archer extends Unit{
  static final int COST = 15;
  
  Archer(boolean _team){
    /******************
      100 is the menuH, height/2 is the maximum height the units will spawn, 20 is so it won't touch menu
      super(int _life, float _speed, int _damage, int _trainingTime, boolean _team, int _y) 
    *******************/
    super(100,1.0,10,2,_team, (int)random(height - 80 - (height/2) - 20));
    if(_team == true){
      position = new PVector(50, height/2 + y); //Spawns unit on the player field
    }
    else{
      position = new PVector(width - 50, height/2 + y); //Spawns unit on the enemy field
    }
    attackRange = 150;
  }
  
  int identifier(){
    return 1;
  }
  
  void drawUnit(){
    stroke(0);
    if(team == true){
      fill(0, 0, 255);
    }
    else{
      fill(255,0,0);  
    }
    ellipse(position.x, position.y,5,5);
  }
}