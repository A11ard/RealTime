ArrayList<Unit> playerTeam;
ALQueue<Unit> playerQueue;
ArrayList<Unit> computerTeam;
Graveyard playerGraveyard; 
Graveyard computerGraveyard;
Menu menu;
boolean doOnce;
boolean isUp, isDown, isLeft, isRight; 



void setup() {
  playerTeam = new ArrayList<Unit>();
  computerTeam = new ArrayList<Unit>();
  playerGraveyard = new Graveyard(); 
  computerGraveyard = new Graveyard(); 
  playerQueue = new ALQueue<Unit>();
  menu = new Menu(); 

  //Spawn Your Commander
  playerTeam.add(new Commander(true));
  
  size(1000, 500);
}

void draw() {
  background(255);
  fill(255);
  menu.loadMenu();
  //Spawning Troops  
  
  if (menu.buttonPressed() == 0 && doOnce == false && menu.getCurrency() >= Swordsmen.COST ) {
    playerTeam.add(new Swordsmen(true));
    //playerQueue.enqueue(new Swordsmen(true));
    menu.changeCurrency(Swordsmen.COST);
    doOnce = true;
  }
  if (menu.buttonPressed() == 1 && doOnce == false) {
    playerTeam.add(new Wizard(true));
    menu.changeCurrency(Wizard.COST);
    doOnce = true;
  }

  if (menu.buttonPressed() == 2 && doOnce == false) {
    computerTeam.add(new Swordsmen(false));
    doOnce = true;
  }
  
  if (menu.buttonPressed() == 3 && doOnce == false && menu.getCurrency() >= Miner.COST ) {
    playerTeam.add(new Miner(true));
    menu.changeCurrency(Miner.COST);
    menu.changeRate(2);
    doOnce = true;
  }  
  
  if (menu.buttonPressed() == 4 && doOnce == false && menu.getCurrency() >= Archer.COST ) {
    playerTeam.add(new Archer(true));
    menu.changeCurrency(Archer.COST);
    doOnce = true;
  } 


  for(int i = 0; i < playerTeam.size(); i++){
    Unit unit = playerTeam.get(i);
    Unit target = unit.selectTarget(computerTeam);
    unit.drawUnit();
    unit.updateHealth();
    unit.attack(target);    
    unit.death(playerTeam, unit);
  }
  for(int i = 0; i < computerTeam.size(); i++){
    Unit unit = computerTeam.get(i);
    Unit target = unit.selectTarget(playerTeam);
    unit.drawUnit();
    unit.updateHealth();
    unit.attack(target);
    unit.death(computerTeam, unit);
  }
}

void mouseReleased() {
  doOnce = false;
}

void keyPressed(){
  if(key == 'w'){
    isUp = true;
  }
  if(key == 'a' ){
    isLeft = true;
  }
  if(key == 's'){ 
    isDown = true;
  }
  if(key == 'd'){
    isRight = true;
  }
}

void keyReleased(){
    if(key == 'w'){
    isUp = false;
  }
  if(key == 'a' ){
    isLeft = false;
  }
  if(key == 's'){ 
    isDown = false;
  }
  if(key == 'd'){
    isRight = false;
  }
}