abstract class Unit{

/********************
  Unit variables
  Self explanatory
*********************/
protected int life; 
protected float speed;
protected int trainingTime; 
protected PVector position; 
protected int damage;
protected boolean team; //Enemy or Player?
protected int y; //Depth
protected float attackRange; 
int lifeinit; //Stores starting health(doesn't change)


abstract void drawUnit();
//abstract void updateHealth();
abstract int identifier();

public Unit(int _life, float _speed, int _damage, int _trainingTime, boolean _team, int _y){
   life = _life;
   speed = _speed;
   trainingTime = _trainingTime;
   damage = _damage; 
   team = _team;
   y = _y;
   lifeinit = life;
   
}

boolean isAlive(){
  return life > 0;
}

void changeLife(int value){
  life -= value; 
}

int getLife(){
  return life;
}

int getTrainingTime(){
  return trainingTime;
}

void changeTrainingTime(){
  trainingTime -= 1;
}


void attack(Unit target){
  if(target == null){ //no target
    move(null);
  }
  else {   
    float distance = position.dist(target.position); //dist from unit to target
    if (attackRange > distance){ //if within range
      if(frameCount % 30 == 0){ //and in attack phase
        //System.out.println("shouldn't be moving");
        target.changeLife(damage);
      }
    }
    else{ //not within range
      move(target);
      //System.out.println("should be moving");
    }
  }
}

void death(ArrayList<Unit> team, Unit unit, Graveyard graveyard){
  if(unit.getLife() <= 0){
    graveyard.enqueue(team.remove(team.indexOf(unit)));
  }
}

void updateHealth(){
    fill(0,255,0);
    float lifebar = 20.0;
    int size = 3;
    rect(position.x, position.y - 5,lifebar,size);
    //Updating health requires this, when you get attacked, creates a new rect that decreases health bar 
    fill(255,0,0);
    rect(position.x + lifebar,position.y - 5,life/(lifeinit/lifebar) - lifebar,size);
  }

/***************************************
 Select the closest enemy unit of the caller as target.
 
 Args:
   enemyTeam (ArrayList<Unit>): Collection of enemy team units
 
 Returns:
   Unit: Enemy unit closest to this instance of Unit.
         Null if no target within range.
 ****************************************/
 Unit selectTarget( ArrayList<Unit> enemyTeam){
   Unit target = null;
   float minDist = 9999; //sight radius expansion here
   for(Unit enemyUnit : enemyTeam){
     if(this.position.dist(enemyUnit.position) < minDist){
       minDist = this.position.dist(enemyUnit.position);
       target = enemyUnit;
     }
   }
   return target;
 }



/*****************************************
 Move a unit foward
 
 If there is a valid target, move towards that target.
 Else, move down the lane, direction dependent on team.
 Suppresses movement if too close to target to avoid unnecessary motion.
 
 Args:
   target (Unit): the target location.
 *****************************************/
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
    float distance = position.dist(target.position); //dist from unit to target
    float deltaX = target.position.x - position.x;   //difference in Xcor
    float deltaY = target.position.y - position.y;   //difference in Ycor
    
    if(distance > speed){
      position.x += speed * deltaX / distance;
      position.y += speed * deltaY / distance;
    }
  }
}

}