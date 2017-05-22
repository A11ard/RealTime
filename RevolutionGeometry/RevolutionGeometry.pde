ArrayList<Unit> playerTeam;
ArrayList<Unit> computerTeam;
Stack playerGraveyard; 
Stack computerGraveyard;
Menu menu;

void setup(){
  playerTeam = new ArrayList<Unit>();
  computerTeam = new ArrayList<Unit>();
  playerGraveyard = new Stack(); 
  computerGraveyard = new Stack();  
  menu = new Menu(); 
  
  for(int counter = 0; counter < 15; counter++){ 
    playerTeam.add(new Swordsmen(true));
    computerTeam.add(new Swordsmen(false));
  }
  size(1000,500);
}

void draw(){
  background(255);
  fill(255);
  menu.loadMenu();
  for(Unit unit : playerTeam){
     fill(0,0,255);
     unit.drawUnit();
     unit.updateHealth();
     unit.move();
     
  }
  for(Unit unit : computerTeam){
    fill(255,0,0);
    unit.drawUnit();
    unit.updateHealth();
    unit.move();
  }

}
