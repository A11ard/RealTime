class Deck<T> {
  int posx;
  int posy;
  String cardName;
  int cardCost;
  int cardIndex;

  ArrayList<T> cards = new ArrayList<T>();

  Deck(int cost, String name, int pos_x, int pos_y, int _index) {
    cardCost = cost;
    cardName = name;
    posx = pos_x;
    posy = pos_y;
    cardIndex = _index;
  }

  void display() {
    rect(posx, posy, 20, 40);
    text(cardName, posx + 20, posy - 20);
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
  
  //Abilities
  
  
}