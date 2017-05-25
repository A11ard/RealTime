ArrayList<Unit> playerTeam;
ALQueue<Unit> playerQueue;
ArrayList<Unit> computerTeam;
Graveyard playerGraveyard; 
Graveyard computerGraveyard;
Menu menu;
boolean doOnce;



void setup() {
  playerTeam = new ArrayList<Unit>();
  computerTeam = new ArrayList<Unit>();
  playerGraveyard = new Graveyard(); 
  computerGraveyard = new Graveyard(); 
  playerQueue = new ALQueue<Unit>();
  menu = new Menu(); 

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
    menu.setCurrency(menu.getCurrency() - Swordsmen.COST);
    doOnce = true;
  }
  if (menu.buttonPressed() == 3 && doOnce == false && menu.getCurrency() >= Miner.COST ) {
    playerTeam.add(new Miner(true));
    //playerQueue.enqueue(new Swordsmen(true));
    menu.setCurrency(menu.getCurrency() - Miner.COST);
    doOnce = true;
  }  
  if (menu.buttonPressed() == 1 && doOnce == false) {
    System.out.println("Wizard");
    doOnce = true;
  }

  if (menu.buttonPressed() == 2 && doOnce == false) {
    computerTeam.add(new Swordsmen(false));
    doOnce = true;
  }


  for(int i = 0; i < playerTeam.size(); i++){
    Unit unit = playerTeam.get(i);
    Unit target = unit.selectTarget(computerTeam);
    fill(0, 0, 255);
    unit.drawUnit();
    unit.updateHealth();
    //unit.move(target);
    if(unit.miner) menu.setCurrency(menu.getCurrency() + 5); //if this unit is a miner, add 20 currency to balance
    unit.attack(target);
    unit.death(playerTeam, unit);
  }
  for(int i = 0; i < computerTeam.size(); i++){
    Unit unit = computerTeam.get(i);
    Unit target = unit.selectTarget(playerTeam);
    fill(255, 0, 0);
    unit.drawUnit();
    unit.updateHealth();
    //unit.move(target);
    //if(unit.miner) menu.setCurrency(menu.getCurrency() + 20); //if this unit is a miner, add 20 currency to balance
    unit.attack(target);
    unit.death(computerTeam, unit);
  }
}

void mouseReleased() {
  doOnce = false;
}
