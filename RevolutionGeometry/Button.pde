class Button{
  int xpos;
  int ypos;
  int button_r = 48;
  String text;
  int index = 0;

  Button(int _xpos, int _ypos, String _text, int _index){
    xpos = _xpos;
    ypos = _ypos;
    text = _text;
    index = _index;
  }

void display(){
  fill(0);
  ellipse(xpos,ypos,button_r,button_r);
  fill(255);
  text(text, xpos - 20, ypos);
}

int getRad(){
  return button_r/2;
}

int x_position(){
  return xpos;
}

int y_position(){
  return ypos; 
}

int getIndex(){
  return index;
}

}