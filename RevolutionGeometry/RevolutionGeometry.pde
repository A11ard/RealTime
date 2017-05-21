ArrayList<Unit> playerTeam;
ArrayList<Unit> computerTeam;

void setup(){
  playerTeam = new ArrayList<Unit>();
  computerTeam = new ArrayList<Unit>();
  
  for(int counter = 0; counter < 15; counter++){ 
    playerTeam.add(new Swordsmen(true));
    computerTeam.add(new Swordsmen(false));
  }
  size(800,400);
}

void draw(){
  background(1);
  fill(0,0,255);
  for(Unit unit : playerTeam){
     unit.drawUnit();
     unit.move();
     
  }
  fill(255,0,0);
  for(Unit unit : computerTeam){
    unit.drawUnit();
    unit.move();
  }

}