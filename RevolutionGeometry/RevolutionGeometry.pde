ArrayList<Unit> playerTeam;
ArrayPriorityQueue playerQueue;
ArrayList<Unit> computerTeam;
int computerCurrency;
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
  playerQueue = new ArrayPriorityQueue();
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
    //playerTeam.add(new Swordsmen(true));
    playerQueue.add(new Swordsmen(true));
    System.out.println(playerQueue);
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


  for (int i = 0; i < playerTeam.size(); i++) {
    Unit unit = playerTeam.get(i);
    Unit target = unit.selectTarget(computerTeam);
    if(playerQueue.removeMin() != null){
      playerTeam.add(playerQueue.removeMin());
    }
    unit.drawUnit();
    unit.updateHealth();
    unit.attack(target);    
    unit.death(playerTeam, unit);
  }
  for (int i = 0; i < computerTeam.size(); i++) {
    Unit unit = computerTeam.get(i);
    Unit target = unit.selectTarget(playerTeam);
    unit.drawUnit();
    unit.updateHealth();
    unit.attack(target);
    unit.death(computerTeam, unit);
  }
  
  AI.choose(playerTeam, computerTeam, computerCurrency);
}

void mouseReleased() {
  doOnce = false;
}

void keyPressed() {
  if (key == 'w' || keyCode == UP) {
    isUp = true;
  }
  if (key == 'a' || keyCode == LEFT) {
    isLeft = true;
  }
  if (key == 's' || keyCode == DOWN) { 
    isDown = true;
  }
  if (key == 'd' || keyCode == RIGHT) {
    isRight = true;
  }
  
}

void keyReleased() {
  if (key == 'w' || keyCode == UP) {
    isUp = false;
  }
  if (key == 'a' || keyCode == LEFT ) {
    isLeft = false;
  }
  if (key == 's' || keyCode == DOWN) { 
    isDown = false;
  }
  if (key == 'd' || keyCode == RIGHT) {
    isRight = false;
  }
}