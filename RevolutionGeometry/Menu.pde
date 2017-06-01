class Menu{
 
  Button[] buttons = new Button[6]; //Buttons in the Menu
  int currency; //Game currency for buying units
  int rate; //Rate of how currency increases
  int start; //Used to calculate currency based off of time
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
     //Swordsmen button
     buttons[0] = new Button(width/2 + 50, height - 40, "Swords", 0);
     buttons[1] = new Button(width/2 + 100, height - 40, "Wizard",1);
     buttons[2] = new Button(width/2 + 150, height - 40, "Enemy",2);
     buttons[3] = new Button(width/2 + 200, height - 40, "Miner",3);
     buttons[4] = new Button(width/2 + 250, height - 40, "Archer",4);
     buttons[5] = new Button(width/2 + 300, height - 40, "Giant",5);
     
     for(Button item: buttons){
       item.display();
     }
     //display currency
     if(millis() - start > 1000){
       currency += rate; // increased rate for testing
       start = millis();
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