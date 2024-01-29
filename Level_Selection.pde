void Level(){
  background(lbck);
  fill(orange);
  noStroke();
  circle(width/5, height/3, 200);
  fill(brown);
  circle(width*0.4, height/3*2, 200);
  fill(blue);
  circle(width*0.6, height/3, 200);
  fill(red);
  circle(width*0.8, height/3*2, 200);
  fill(white);
  textFont(pixel);
  textSize(32);
  text("GUIDE", width/5-70, height/3+17);
  textSize(25);
  text("LEVEL 1", width*0.4-70, height/3*2+15);
  text("LEVEL 2", width*0.6-70, height/3+15);
  text("LEVEL 3", width*0.8-70, height/3*2+15);
  strokeWeight(3);
  stroke(black);
  square(40, 40, 55);
  fill(black);
  triangle(50, 20, 50, 55, 20, 37.5);
}

void lmouse(){
  if (mouseX>12.5&&mouseX<67.5&&mouseY>12.5&&mouseY<67.5) mode=intro;
  if (dist(width/5, height/3, mouseX, mouseY)<100) {
    mode=game;
    thisGame=map;
    worldReset(thisGame);
    //song=minimtool.loadFile("game_opener.wav");
    //song.play();
  }
  if (dist(width*0.4, height/3*2, mouseX, mouseY)<100) {
    mode=game;
    thisGame=map1;
    worldReset(thisGame);
    //song=minimtool.loadFile("game_opener.wav");
    //song.play();
  }
  //if (dist(width*0.6, height/3, mouseX, mouseY)<100) {
  //  mode=game;
  //  //thisImage=map2;
  //}
  //if (dist(width*0.8, height/3*2, mouseX, mouseY)<100) {
  //  mode=game;
  //  //thisImage=map3;
  //}
}
