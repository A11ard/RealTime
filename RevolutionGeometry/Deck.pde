class Deck<T> {
  int posx;
  int posy;
  String cardName;
  int cardCost;
  int cardIndex;

  Deck(int cost, String name, int _index) {
    cardCost = cost;
    cardName = name;
    cardIndex = _index;
  }
  
    void display(int x, int y) {
      posx = x;
      posy = y;
      fill(255,0,0);
      rect(posx, posy, 20, 20);
      fill(0);
      text(cardName, posx + 20, posy);
  }


  int x_pos() {
    return posx;
  }

  int y_pos() {
    return posy;
  }

  int getCardIndex() {
    return cardIndex;
  }
  
  int getCardCost(){
    return cardCost;
  }
  
  void use(){
    if(cardIndex == 0){
      System.out.println("heal");
    }
    if(cardIndex == 1){
      System.out.println("revive");
    }
    if(cardIndex == 2){
      System.out.println("fireball");
    }
    if(cardIndex == 3){
      System.out.println("Increase stash");
    }
    if(cardIndex == 4){
      System.out.println("Commander strength");
    }
  }
  
  //Abilities
  
  
}