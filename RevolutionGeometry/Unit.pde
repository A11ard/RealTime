abstract class Unit{

protected int life; 
protected float speed;
protected int trainingTime; 
//protected int cost;
protected PVector position; 
protected int damage;
protected boolean team;
protected int y;
protected float attackRange;

abstract void drawUnit();
abstract void updateHealth();
abstract int identifier();

public Unit(int _life, float _speed, int _damage, int _trainingTime, boolean _team, int _y){
   life = _life;
   speed = _speed;
   trainingTime = _trainingTime;
   damage = _damage; 
   team = _team;
   y = _y;
   
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

void attack(Unit target){
<<<<<<< HEAD
 
=======
  float distance = position.dist(target.position); //dist from unit to target
  if (attackRange > distance){
    target.life -= damage;
  }
  else {
    move(target);
  }
>>>>>>> 963cb06ed36a7ce67c483415783482cc83efedcc
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