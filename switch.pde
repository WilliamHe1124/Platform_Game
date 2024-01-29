boolean touchNpc=false;

void checkSwitch(){
  if (hll(character, switches)) switchOn=true;
  if (switchOn){
    for (int i=0; i<removable.size(); i++)
    world.remove(removable.get(i));
    switches.get(0).attachImage(swtOn);
  }
  if (!switchOn) switches.get(0).attachImage(swtOff);
}

void checkEnd(){
  if (hll(character, treasures)) {
    tgot=true;
    world.remove(treasures.get(0));
  }
}

void checkSaved(){
  for (int i=0;i<savePoints.size();i++){
    if (hl(character, savePoints.get(i))){
      startx=savePoints.get(i).getX();
      starty=savePoints.get(i).getY();
      savePoints.get(i).attachImage(saved);
    }
  }
}

void checkNpc(){
  if (hl(character, npcs.get(0))){
    touchNpc=true;
    fill(white);
    rectMode(CENTER);
    rect(width/3*2, height/2, 100, 50);
    textSize(12);
    fill(black);
    text("Press T", width/3*2-40, height/2+7);
  } else touchNpc=false;
}
