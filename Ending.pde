void End(){
  background(endBg);
  textSize(70);
  fill(ggreen);
  text("LEVEL CLEARED", 80, height/2-100);
  startx=20;
  starty=0;
}

void emouse(){
  mode=intro;
}
