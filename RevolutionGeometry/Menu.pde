class Menu {

  Button[] buttons = new Button[6]; //Buttons in the Menu
  ALQueue<Deck> deckList = new ALQueue<Deck>();
  ArrayList<Deck> deckCards = new ArrayList<Deck>();
  //Deck[] deckCards = new Deck[1];
  int currency; //Game currency for buying units
  int rate; //Rate of how currency increases
  int start; //Used to calculate currency based off of time
  int timer; //Game timer
  //castle health
  //deck + utility cards
  //units on field
  Menu() {
    currency = 0; 
    rate = 5; //increased coinage 

    //Buttons
    buttons[0] = new Button(width/2 + 70, height - 40, "Swords", 0); 
    buttons[1] = new Button(width/2 + 120, height - 40, "Wizard", 1);
    buttons[2] = new Button(width/2 + 170, height - 40, "Miner", 2);
    buttons[3] = new Button(width/2 + 220, height - 40, "Archer", 3);
    buttons[4] = new Button(width/2 + 270, height - 40, "Giant", 4);
    buttons[5] = new Button(width/2 + 320, height - 40, "REVIVE", 5);

    //Cards
    deckList.enqueue(new Deck(10, "Heal", 0));
    //deckList.enqueue(new Deck(20, "Revive", 1));
    deckList.enqueue(new Deck(10, "Speed", 1));
    deckList.enqueue(new Deck(0, "Gold", 2));
    deckList.enqueue(new Deck(10, "Power", 3));

    //add to displayed cards
    deckCards.add(deckList.dequeue());
    deckCards.add(deckList.dequeue());
    deckCards.add(deckList.dequeue());
  }


  int menuH = 80;
  void loadMenu() {

    //upper boundary
    rect(0, height/2, width, 0);

    //lower menu
    fill(211, 211, 211);
    rect(0, height - menuH, width, menuH);
    //image(boardImg,0, height - 80, width, 80);

    for (Button item : buttons) {
      item.display();
      //display cost for each button
    }




    //display cards
    for (int i = 0; i < deckCards.size(); i++) {
      //set positions
      if (i == 0) {
        deckCards.get(i).display(width/2 - 150, height - 40);
      }
      if (i == 1) {
        deckCards.get(i).display(width/2 - 220, height - 40);
      }
      if (i == 2) {
        deckCards.get(i).display(width/2 - 290, height - 40);
      }
    }

    /*
     if(millis() - start > 1000){
     currency += rate; // increased rate for testing
     start = millis();
     }
     */
    //display currency
    if (frameCount % 60 == 0) {
      currency += rate;
    }
    noFill();
    rect(width/2 - 70, height - 58, 100, 25);
    fill(0);
    text("Currency: ", width/2 - 65, height - 40);
    text(currency, width/2, height - 40);

    //timer
    timer = millis()/1000;
    text(timer, width/2, height/2);
  }


  int buttonPressed() {
    for (Button item : buttons) {
      if ((dist(mouseX, mouseY, item.x_position(), item.y_position()) < item.getRad()) && mousePressed) {
        return item.getIndex();
      }
    } 
    return -1;
  }

  Deck cardbuttonPressed() {
    for (Deck item : deckCards) {
      if ((dist(mouseX, mouseY, item.x_pos(), item.y_pos()) < 20) && mousePressed) {
        return item;
      }
    }
    return null;
  }
  void cardPressed() {
        if (cardbuttonPressed() != null && doOnce == false && getCurrency() >= cardbuttonPressed().getCardCost()) {
          Deck temp = cardbuttonPressed();
        System.out.println(cardbuttonPressed());
        //activate effect
        cardbuttonPressed().use();
        //remove card and enqueue
        deckCards.remove((cardbuttonPressed()));
        deckList.enqueue(temp);
        //change currency
        menu.changeCurrency(temp.getCardCost());
        
        
         
            
        doOnce = true;
      }
      //dequeue and reset back into the field
      if(frameCount % 900 == 0 && deckCards.size() < 3){
         deckCards.add(deckList.dequeue()); 
       } 
    }
  

  int getCurrency() {
    return currency;
  }

  void changeRate(int value) {
    rate += value;
  }

  void changeCurrency(int value) {
    currency -= value;
  }


  int getTime() {
    return timer;
  }
}