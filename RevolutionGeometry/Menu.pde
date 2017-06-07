class Menu {

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
  Menu() {
    currency = 0; 
    rate = 5; //increased coinage

    //Buttons
    buttons[0] = new Button(width/2 + 70, height - 40, "Swords", 0); 
    buttons[1] = new Button(width/2 + 120, height - 40, "Wizard", 1);
    buttons[2] = new Button(width/2 + 170, height - 40, "Miner", 2);
    buttons[3] = new Button(width/2 + 220, height - 40, "Archer", 3);
    buttons[4] = new Button(width/2 + 270, height - 40, "Giant", 4);


    //Cards
    deckList.enqueue(new Deck(10, "FirstCard", 0));
    deckList.enqueue(new Deck(20, "SecondCard", 1));
    deckList.enqueue(new Deck(10, "ThirdCard", 2));
    deckList.enqueue(new Deck(20, "FourthCard", 3));
    deckList.enqueue(new Deck(10, "FifthCard", 4));
    deckList.enqueue(new Deck(20, "SixthCard", 5));
    deckList.enqueue(new Deck(10, "SeventhCard", 6));
    deckList.enqueue(new Deck(20, "EigthCard", 7));
    deckList.enqueue(new Deck(10, "NinethCard", 8));
    deckList.enqueue(new Deck(20, "TenthCard", 9));

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

  boolean cardbuttonPressed() {
    for (Deck item : deckCards) {
      if ((dist(mouseX, mouseY, item.x_pos(), item.y_pos()) < 15) && mousePressed) {
        return true;
      }
    }
    return false;
  }
  void cardPressed() {
    for (int i = 0; i < deckCards.size(); i++) {
      if ((menu.cardbuttonPressed() && doOnce == false) && menu.getCurrency() >= deckCards.get(i).getCardCost()) {
        //activate effect
        deckCards.get(i).use();
        //remove card and enqueue
        deckList.enqueue(deckCards.remove(i));
        //dequeue and reset back into the field
        deckCards.add(deckList.dequeue());
        //change currency
        menu.changeCurrency(deckCards.get(i).getCardCost());
        doOnce = true;
      }
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