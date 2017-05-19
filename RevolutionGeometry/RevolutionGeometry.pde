ArrayList<Swordsmen> playerTeam;
ArrayList<Swordsmen> computerTeam;

void setup(){
  playerTeam = new ArrayList<Swordsmen>();
  computerTeam = new ArrayList<Swordsmen>();
  size(400,400);
}

void draw(){
  background(1);
  fill(0,0,255); //blue team
  for(Swordsmen unit : playerTeam){
    unit.drawUnit();
  }
  
  for(Swordsmen unit : computerTeam){
    unit.drawUnit();
}