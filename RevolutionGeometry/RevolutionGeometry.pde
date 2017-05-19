ArrayList<Swordsmen> playerTeam;
ArrayList<Swordsmen> computerTeam;

void setup(){
  playerTeam = new ArrayList<Swordsmen>();
  computerTeam = new ArrayList<Swordsmen>();
  size(400,400);
}

void draw(){
  background(1);

  //code for displaying
  fill(0,0,255); //blue team (player)
  for(Swordsmen unit : playerTeam){
    unit.drawUnit();
  }
  fill(255,0,0); //red team (computer)
  for(Swordsmen unit : computerTeam){
    unit.drawUnit();
  }

  //attack if there are units in range to attack, move foward if not.
  for(Swordsmen attackUnit : playerTeam){
    for(Swordsmen defendUnit : computerTeam){
      if(attackUnit.x - attackUnit.x < 10){
        attackUnit.attack(defendUnit);
      }
      else{
        attackUnit.move();
      }
    }
  }
  for(Swordsmen attackUnit : computerTeam){
    for(Swordsmen defendUnit : playerTeam){
      if(attackUnit.x - attackUnit.x < 10){
        attackUnit.attack(defendUnit);
      }
      else{
        attackUnit.move();
      }
    }
  }

  //time to die
  for(int counter = 0; counter < computerTeam.size();){
    if (computerTeam.get(counter).life <= 0){
      computerTeam.remove(counter)
    }
    else {
      counter += 1;
    }
  }
  for(int counter = 0; counter < playerTeam.size();){
    if (playerTeam.get(counter).life <= 0){
      playerTeam.remove(counter)
    }
    else {
      counter += 1;
    }
  }
}