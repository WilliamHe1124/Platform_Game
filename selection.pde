boolean pchosen=true;
boolean dchosen=false;

void Selection(){
  background(lgreen);
  fill(white);
  strokeWeight(3);
  stroke(black);
  square(40, 40, 55);
  fill(black);
  triangle(50, 20, 50, 55, 20, 37.5);
  image(self[0], width/4-50, height*0.6, 100, 100);
  image(dog[0], width*0.75-50, height*0.6, 100, 100);
  textSize(40);
  text("Choose your character", 125, 100);
  if (pchosen) {
    image(self[0], width/2-50, height/2-50, 100, 100);
  }
  if (dchosen){
    image(dog[0], width/2-50, height/2-50, 100, 100);
  }
}

void smouse(){
  if (mouseX>12.5&&mouseX<67.5&&mouseY>12.5&&mouseY<67.5) mode=intro;
  if (mouseX>width/4-50&&mouseX<width/4+50&&mouseY>height*0.6&&mouseY<height*0.6+100) {
    pchosen=true;
    dchosen=false;
  }  
  if (mouseX>width*0.75-50&&mouseX<width*0.75+50&&mouseY>height*0.6&&mouseY<height*0.6+100) {
    pchosen=false;
    dchosen=true;
  }
}
