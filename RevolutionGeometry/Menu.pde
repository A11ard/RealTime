class Menu{
 
  Button[] buttons = new Button[5]; //Buttons in the Menu
  ALQueue<Deck> deckList = new ALQueue<Deck>();
  ArrayList<Deck> deckCards = new ArrayList<Deck>();
  //Deck[] deckCards = new Deck[1];
  int currency; //Game currency for buying units
  int rate; //Rate of how currency increases
  //int start; //Used to calculate currency based off of time
  int timer; //Game timer
  //castle health
  //deck + utility cards
  //units on field
 Menu(){
     currency = 0; 
     rate = 5; //increased coinage
     
     //Buttons
     buttons[0] = new Button(width/2 + 70, height - 40, "Swords", 0); 
     buttons[1] = new Button(width/2 + 120, height - 40, "Wizard",1);
     buttons[2] = new Button(width/2 + 170, height - 40, "Miner",2);
     buttons[3] = new Button(width/2 + 220, height - 40, "Archer",3);
     buttons[4] = new Button(width/2 + 270, height - 40, "Giant",4);
     
     
     //Cards
     deckList.enqueue(new Deck(10, "FirstCard",width/2, height - 40, 0));
     deckList.enqueue(new Deck(20, "SecondCard", width/2 - 10, height - 40, 1));
     deckList.enqueue(new Deck(10, "ThirdCard",width/2 - 40, height - 40, 2));
     deckList.enqueue(new Deck(20, "FourthCard", width/2- 70, height - 50, 3));
     deckList.enqueue(new Deck(10, "FifthCard",width/2- 100, height - 40, 4));
     deckList.enqueue(new Deck(20, "SixthCard", width/2- 130, height - 50, 5));
     deckList.enqueue(new Deck(10, "SeventhCard",width/2- 160, height - 40, 6));
     deckList.enqueue(new Deck(20, "EigthCard", width/2- 190, height - 50, 7));
     deckList.enqueue(new Deck(10, "NinethCard",width/2- 210, height - 40, 8));
     deckList.enqueue(new Deck(20, "TenthCard", width/2- 240, height - 50, 9));
     
     deckCards.add(deckList.dequeue());
     deckCards.add(deckList.dequeue());
     deckCards.add(deckList.dequeue());
     
 }
 
 
   int menuH = 80;
   void loadMenu(){
     //upper boundary
     rect(0,height/2,width,0);

     //lower menu
     fill(211,211,211);
     rect(0,height - menuH,width,menuH);
     //image(boardImg,0, height - 80, width, 80);
     
     for(Button item: buttons){
       item.display();
       //display cost for each button
     }
     
     //display cards
    for(Deck item: deckCards){
      item.display();
    }
     
     /*
     if(millis() - start > 1000){
       currency += rate; // increased rate for testing
       start = millis();
     }
     */
     //display currency
     if(frameCount % 60 == 0){
       currency += rate;
     }
     noFill();
     rect(width/2 - 70, height - 58,100, 25);
     fill(0);
     text("Currency: ", width/2 - 65, height - 40);
     text(currency, width/2,height - 40);
      
     //timer
     timer = millis()/1000;
     text(timer,width/2,height/2);
  }
  
  
  int buttonPressed(){
     for(Button item: buttons){
       if((dist(mouseX, mouseY,item.x_position(),item.y_position()) < item.getRad()) && mousePressed){
           return item.getIndex();        
        }      
     } 
     return -1;
  }
  
  int cardbuttonPressed(){
    for(Deck item: deckCards){
      if((dist(mouseX, mouseY,item.x_pos(),item.y_pos()) < 10) && mousePressed){
        System.out.println(item.getCardIndex());
        return item.getCardIndex();
      }
    }
    return -1;
  }
  
  //Stuff that im going to put in driver
  for(Deck item: deckList){
  if (menu.cardbuttonPressed() == 0 && doOnce == false && menu.getCurrency() >= 10) {
    deckCards.remove()
    //System.out.println(playerQueue);
    menu.changeCurrency(Swordsmen.COST);
    doOnce = true;
  }
  }
  
  
  
  
  
  int getCurrency(){
    return currency;
  }
  
  void changeRate(int value){
    rate += value;
  }
  
  void changeCurrency(int value){
    currency -= value;
  }
  
  
  int getTime(){
    return timer;
  }
  
}