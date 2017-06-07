class Wizard extends Unit{
  static final int COST = 50;

  
  Wizard(boolean _team){
    /******************
      100 is the menuH, height/2 is the maximum height the units will spawn, 20 is so it won't touch menu
      super(int _life, float _speed, int _damage, int _trainingTime, boolean _team, int _y)
    ******************/
    super(100,1.0,20,2,_team, (int)random(height - 80 - (height/2) - 20));
    if(_team == true){
      position = new PVector(50, height/2 + y); //Spawns unit on the player field
    }
    else{
      position = new PVector(width - 50, height/2 + y); //Spawns unit on the enemy field
    }
    attackRange = 130;
  }



  int identifier(){
    return 2;
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
    //rect(position.x+5,position.y,10,10);
    triangle(position.x+5, position.y, position.x+13, position.y-20, position.x+21, position.y); 
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
  
  
  void attack(Unit target){
    if(target != null){
      float distance = this.position.dist(target.position); //dist from unit to target;     
      if (attackRange > distance){ //if within range      
        ArrayPriorityQueue possibleTargets = new ArrayPriorityQueue(); //make a priority queue of enemy troops
        ArrayList<Unit> opposingTeam = new ArrayList<Unit> (); 
        if(team){
          opposingTeam = computerTeam;
        }
        else {
          opposingTeam = playerTeam;
        }
        //copy only units within the range of the wizard's lightning range (set to 160) into possibleTargets 
        for(Unit unit : opposingTeam){
          if(160 > this.position.dist(unit.position)){//for all opposing units IN 160 radius, add it to the list of possible targets
            possibleTargets.add(unit); 
          }
        }
        
        //this goes through ArrayPriorityQueue possibleTargets to get the possible targets
        for(int x = 0; x < 4; x++){//take the first 4 with lowest health and strike these
          try{            
            possibleTargets.removeMinH().changeLife(1);                            
          }
          catch(NullPointerException e){
            break; 
          }
        }
      }
      else{
        move(target); 
      }
    }
  }

/*
  void attack (Unit target){
    if (target != null){
      float distance = position.dist(target.position);
      if(attackRange > distance){
        ArrayPriorityQueue possibleTargets = new ArrayPriorityQueue();
        if (team){
          
        }
        else{
          
        }
      }
 */ 
}