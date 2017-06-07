ArrayList<Unit> playerTeam; //Arraylist of player units
ArrayPriorityQueue playerQueue; //PriorityQueue for player units before inserting into playerTeam
int time; //time counter for giving computer currency
Graveyard playerGraveyard; //player graveyard, where killed units are sent
Graveyard computerGraveyard; //comptuer graveyard, where killed computer units are sent
Menu menu; //defines the menu 
boolean doOnce; //doOnce, determines if you a button has been pressed once
boolean isUp, isDown, isLeft, isRight, isAttack;  //boolean values for determining where the Commander unit is gonig
int attackCharge; //intializes attack charge
Miner miner; //spawn Miner
PImage playerCastleImg; 
PImage enemyCastleImg;
PImage skyImg; 
PImage boardImg;
//PImage pathImg;
ArrayList<Unit> computerTeam; //Arraylist of enemy units
ArrayPriorityQueue computerQueue; // PriorityQueue for computer units before inserting into computerTeam
int computerCurrency; //Computer currency
int lastComputerUnitTrained; //keep track of the most recently trained unit to avoid giant spamming
int graveyardTimer;//timer for when we can use the REVIVE button again 

void setup() {
  playerTeam = new ArrayList<Unit>();
  computerTeam = new ArrayList<Unit>();
  playerGraveyard = new Graveyard(); 
  computerGraveyard = new Graveyard(); 
  playerQueue = new ArrayPriorityQueue();
  computerQueue = new ArrayPriorityQueue();
  menu = new Menu(); 
  lastComputerUnitTrained = -1;
  
  //spawn Miner
  miner = new Miner(true);

  //Spawn Nexuses
  playerTeam.add(new Nexus(true));
  computerTeam.add(new Nexus(false));
  size(1250, 500);
  
  //Spawn Your Commander
  playerTeam.add(new Commander(true));
  attackCharge = 3; //sets attack charge
  
  //Load images
  playerCastleImg = requestImage("playerCastle.png");
  enemyCastleImg = requestImage("enemyCastle.png");
  //skyImg = requestImage("bluesky.png");
  //boardImg = loadImage("boardMenu.jpg");
  //pathImg = loadImage("dirtPath.jpg");
}

void draw() {

  background(255);
  //fill(255);
  menu.loadMenu();
  menu.cardPressed();
  //System.out.print(mouseX + ", " + mouseY); 
  image(playerCastleImg, 0, height/2,170,170);
  image(enemyCastleImg, width - 170, height/2, 170,170);
  //image(skyImg, 0, 0, width, height/2);

  //ADD UNITS TO QUEUE ON BUTTON PRESS
  if (menu.buttonPressed() == 0 && doOnce == false && menu.getCurrency() >= Swordsmen.COST ) {
    playerQueue.add(new Swordsmen(true));
    //System.out.println(playerQueue);
    menu.changeCurrency(Swordsmen.COST);
    doOnce = true;
  }
  if (menu.buttonPressed() == 1 && doOnce == false && menu.getCurrency() >= Wizard.COST) {
    playerQueue.add(new Wizard(true));
    menu.changeCurrency(Wizard.COST);
    doOnce = true;
  }
  

  if (menu.buttonPressed() == 2 && doOnce == false && menu.getCurrency() >= miner.getCost()) {
    playerQueue.add(new Miner(true));
    menu.changeCurrency(miner.getCost());
    miner.changeCost(20);
    menu.changeRate(2);
    doOnce = true;
  }  

  if (menu.buttonPressed() == 3 && doOnce == false && menu.getCurrency() >= Archer.COST ) {
    playerQueue.add(new Archer(true));
    menu.changeCurrency(Archer.COST);
    doOnce = true;
  } 
  
  if (menu.buttonPressed() == 4 && doOnce == false && menu.getCurrency() >= Giant.COST ) {
    playerQueue.add(new Giant(true));
    menu.changeCurrency(Giant.COST);
    doOnce = true;
  }
  
  if (menu.buttonPressed() == 5 && doOnce == false && !playerGraveyard.isEmpty() && graveyardTimer > 100){
    graveyardTimer = 0; 
    int graveyardCost = playerGraveyard.peek().getCost() * 3 / 4;
    if( menu.getCurrency() >= graveyardCost){    
      int unitID = playerGraveyard.dequeue().identifier();
      Unit unit = null;
      if (unitID == 0){
        unit = new Swordsmen(true);
      }
      if (unitID == 1){
        unit = new Archer(true);
      }
      if (unitID == 2){
        unit = new Archer(true);
      }
      if (unitID == 5){
        unit = new Giant(true);
      }
      playerTeam.add(unit);
      menu.changeCurrency(graveyardCost);
      doOnce = true;
    }
  }
  graveyardTimer++; 
  
  
  //computer action
  int numComputerMiner = 0;
    for (Unit unit: computerTeam){
      if (unit.identifier() == 4){
        numComputerMiner ++; 
      }
    }
  if(millis() - time > 1000){
       computerCurrency += numComputerMiner * 2 + 10; // increased rate for testing
       time = millis();
  }
  if(computerQueue.isEmpty()){
    int[] AIChoice = AI.choose(playerTeam, computerTeam, computerCurrency, lastComputerUnitTrained);
    if(AIChoice[0] == 0){
      if(AIChoice[1] == 0){
        computerQueue.add(new Swordsmen(false));
      }
      if(AIChoice[1] == 1){
        computerQueue.add(new Archer(false));
      }
      if(AIChoice[1] == 2){
        computerQueue.add(new Wizard(false));
      }
      if(AIChoice[1] == 4){
        computerQueue.add(new Miner(false));
      }
      if(AIChoice[1] == 5){
        computerQueue.add(new Giant(false));
      }
      lastComputerUnitTrained = AIChoice[1];
    }
  }
  
  //ADDING UNITS TO THE FIELD BASED OFF OF TRAINING TIME
  if(!playerQueue.isEmpty()){
    Unit removedThing = playerQueue.removeMin();
    if(removedThing == null){
      playerQueue.changeTime();   
    }
    else{
      playerTeam.add(removedThing);
    }
  }
  
  if(!computerQueue.isEmpty()){
    Unit removedThing = computerQueue.removeMin();
    if(removedThing == null){
      computerQueue.changeTime();
    }
    else{
      computerTeam.add(removedThing);
    }
  }
  
  //MAIN PLAYERTEAM ACTIONS
  for (int i = 0; i < playerTeam.size(); i++) {
    Unit unit = playerTeam.get(i);
    Unit target = unit.selectTarget(computerTeam);
    unit.drawUnit();
    unit.updateHealth();
    unit.attack(target);    
    unit.death(playerTeam, unit, playerGraveyard);
    //System.out.println(unit.getTrainingTime());
  }
  //MAIN COMPUTERTEAM ACTIONS
  for (int i = 0; i < computerTeam.size(); i++) {
    Unit unit = computerTeam.get(i);
    Unit target = unit.selectTarget(playerTeam);
    unit.drawUnit();
    unit.updateHealth();
    unit.attack(target);
    unit.death(computerTeam, unit, computerGraveyard);
  }
  
  if (computerTeam.isEmpty() || computerTeam.get(0).identifier() != 10){
    win(true);
  }
  if (playerTeam.isEmpty() || playerTeam.get(0).identifier() != 10){
    win(false); 
  }
}

void mouseReleased() {
  doOnce = false;
}


/******************************
  For Commander Unit
  keyPressed() determines which key is pressed and sets the boolean value accordingly
  keyReleased() sets the boolean back to false to stop the character from moving 
******************************/
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
  if(key == 'j'){
    isAttack = true;
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
  if(key == 'j'){
    isAttack = false;
    attackCharge = 3;
  }
}

void win(boolean team){
  PImage img;
  if(team){
    img = loadImage("data/victory.png");
    print("you win");
  }
  else {
    img = loadImage("data/defeat.png");
    print("you lost");
  }
  image(img, 300, 100, 650, 300);
  noLoop();
}