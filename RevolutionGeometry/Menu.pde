class Menu{
 
  Button[] buttons = new Button[5]; //Buttons in the Menu
  ALQueue<Deck> deckList = new ALQueue<Deck>();
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
 }
 
 
   int menuH = 80;
   void loadMenu(){
     //upper boundary
     rect(0,height/2,width,0);

     //lower menu
     fill(211,211,211);
     rect(0,height - menuH,width,menuH);
     //image(boardImg,0, height - 80, width, 80);
     //Buttons
     buttons[0] = new Button(width/2 + 70, height - 40, "Swords", 0); 
     buttons[1] = new Button(width/2 + 120, height - 40, "Wizard",1);
     buttons[2] = new Button(width/2 + 170, height - 40, "Miner",2);
     buttons[3] = new Button(width/2 + 220, height - 40, "Archer",3);
     buttons[4] = new Button(width/2 + 270, height - 40, "Giant",4);
     
     for(Button item: buttons){
       item.display();
     }
     
     //Cards
     deckList.enqueue(new Deck(10, "FirstCard",width/2, height - 40, 0));
     deckList.enqueue(new Deck(20, "SecondCard", width/2 - 10, height - 40, 0));
     deckList.enqueue(new Deck(10, "ThirdCard",width/2 - 20, height - 40, 0));
     deckList.enqueue(new Deck(20, "FourthCard", width/2- 30, height - 50, 0));
     deckList.enqueue(new Deck(10, "FifthCard",width/2- 40, height - 40, 0));
     deckList.enqueue(new Deck(20, "SixthCard", width/2- 50, height - 50, 0));
     deckList.enqueue(new Deck(10, "SeventhCard",width/2- 60, height - 40, 0));
     deckList.enqueue(new Deck(20, "EigthCard", width/2- 70, height - 50, 0));
     deckList.enqueue(new Deck(10, "NinethCard",width/2- 80, height - 40, 0));
     deckList.enqueue(new Deck(20, "TenthCard", width/2- 90, height - 50, 0));
     
     //display currency
     /*
     if(millis() - start > 1000){
       currency += rate; // increased rate for testing
       start = millis();
     }
     */
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