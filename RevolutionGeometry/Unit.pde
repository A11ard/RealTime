abstract class Unit{

protected int life; 
protected float speed;
protected int trainingTime; 
protected int cost;
protected PVector position; 
protected int damage;
protected boolean team;
protected int y;

abstract void attack(Unit unit);
abstract void drawUnit();
abstract void move();
abstract void updateHealth();

public Unit(int _life, float _speed, int _damage, int _trainingTime, int _cost, boolean _team, int _y){
   life = _life;
   speed = _speed;
   trainingTime = _trainingTime;
   cost = _cost; 
   damage = _damage; 
   team = _team;
   y = _y;
   
}

boolean isAlive(){
  return life > 0;
}

int getLife(){
  return life;
}
int getCost(){
  return cost;
}



}