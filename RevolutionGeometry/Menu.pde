class Menu{
  
  //Buttons
  Button[] buttons = new Button[3];
  int currency;
  //castle health
  //currency you have
  //deck + utility cards
  //units on field
 Menu(){
   currency = 0; 
 }
 
 
   int menuH = 80;
   void loadMenu(){
     //upper boundary
     rect(0,height/2,width,0);
     //lower menu
     fill(211,211,211);
     rect(0,height - menuH,width,menuH);
     //Swordsmen button
     buttons[0] = new Button(width/2 + 90, height - 40, "Swords", 0);
     buttons[1] = new Button(width/2 + 180, height - 40, "Wizard",1);
     buttons[2] = new Button(width/2 + 270, height - 40, "Enemy",2);
     
     for(Button item: buttons){
       item.display();
     }
     //display currency
     currency = millis()/1000;
     noFill();
     rect(width/2 - 70, height - 58,100, 25);
     fill(0);
     text("Currency: ", width/2 - 65, height - 40);
     text(currency, width/2,height - 40);
  
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
  
}