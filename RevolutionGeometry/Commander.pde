class Commander extends Unit{
  static final int COST = 25;
  int start;
  Commander(boolean _team){
    /******************
      100 is the menuH, height/2 is the maximum height the units will spawn, 20 is so it won't touch menu
      super(int _life, float _speed, int _damage, int _trainingTime, boolean _team, int _y)
    ******************/
    super(500,1.0,2,2,_team, (int)random(height - 80 - (height/2) - 20));
    if(_team == true){
      position = new PVector(120, height/2 + y); //Spawns unit on the player field
    }
    else{
      position = new PVector(width - 50, height/2 + y); //Spawns unit on the enemy field
    }
    attackRange = 20;
  }

  int getCost(){
    return COST;
  }

  int identifier(){
    return 3;
  }
  
  void increaseDamage(){
    damage += 1;
  }
  
  void increaseSpeed(){
    speed += 0.5;
  }
  
  void regen(){
    if(life < lifeinit){
      life += 1;
    }
  }
   
void attack(Unit target){
  //Movement Detection
    if(isUp && position.y >= height/2){
     position.y -= speed;}
    if(isLeft){
     position.x -= speed;}
    if(isDown && position.y <= height - 95){
      position.y += speed;}
    if(isRight){
      position.x += speed;}
  //Special Attack Functions
    if(isAttack && attackCharge > 0){
      noFill();
      stroke(0);
      ellipse(position.x+10,position.y+2, 30,30);
       if(millis() - start > 1000){
         attackCharge -= 1;
         start = millis();
       }
 
      text(attackCharge, position.x + 7, position.y - 15);
      
  //No Target
     if(target == null){ 
        return;
     }
  //Determines if in attackRange
     else{
      float distance = position.dist(target.position); //dist from unit to target
      if (attackRange > distance){ //if within range
          target.changeLife(damage);  
      }
     }
    }
  
}

 
  /**
    Draws a swordsman as a 10 by 10 square centered at its (x,y) coordinates.
  **/
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