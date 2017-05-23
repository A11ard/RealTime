ArrayList<Unit> playerTeam;
ArrayList<Unit> computerTeam;
Graveyard playerGraveyard; 
Graveyard computerGraveyard;
Menu menu;
boolean doOnce;



void setup(){
  playerTeam = new ArrayList<Unit>();
  computerTeam = new ArrayList<Unit>();
  playerGraveyard = new Graveyard(); 
  computerGraveyard = new Graveyard();  
  menu = new Menu(); 
  
  size(1000,500);
}

void draw(){
  background(255);
  fill(255);
  menu.loadMenu();
  //Spawning Troops  
  if(menu.buttonPressed() == 0 && doOnce == false){
    playerTeam.add(new Swordsmen(true));
    doOnce = true;
  }
  if(menu.buttonPressed() == 1 && doOnce == false){
    playerTeam.add(new Swordsmen(true));
    doOnce = true;
  }
  
  if(menu.buttonPressed() == 2 && doOnce == false){
    computerTeam.add(new Swordsmen(false));
    doOnce = true;
  }
  
  
  for(Unit unit : playerTeam){
     Unit target = unit.selectTarget(computerTeam);
     fill(0,0,255);
     unit.drawUnit();
     unit.updateHealth();
     unit.attack(target);
     
  }
  for(Unit unit : computerTeam){
    Unit target = unit.selectTarget(playerTeam);
    fill(255,0,0);
    unit.drawUnit();
    unit.updateHealth();
    unit.attack(target);
  }

}

void mouseReleased(){
  doOnce = false;
}
