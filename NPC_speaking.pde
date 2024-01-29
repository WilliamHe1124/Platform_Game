int inx;
String[] words=new String[10];

void NPC(){
  setWords();
  fill(white);
  rectMode(CORNER);
  rect(0, height/3*2, width, height/3);
  if (inx<words.length&&!words[inx].equals("")){
    fill(black);
    textSize(20);
    text(words[inx], width/6-150, height/4*3);
  } else if (tgot){
    mode=end;
  } else {
    inx=0;
    mode=game;
  }
}

void setWords(){
  if (thisGame==map&&!tgot){
    words=new String[7];
    words[0]=("Welcome to this world, young man!");
    words[1]=("Now I'm going to teach you how to survive in this world!");
    words[2]=("First, do not touch the lava or the monsters.");
    words[3]=("They will kill you instantaneously.");
    words[4]=("But if you step on the monsters, you can kill them.");
    words[5]=("There are other terrain out there to explore in this area");
    words[6]=("Enjoy!");
  } else if (thisGame==map1&&!tgot){
    words=new String[4];
    words[0]=("Hi young man, could you do me a favor?");
    words[1]=("My treasure was stolen by the Goombas");
    words[2]=("Can you get it back for me?");
    words[3]=("Good Luck!");
  } else if (thisGame==map1&&tgot){
    words=new String[1];
    words[0]=("Thank you young man!");
  } else if (thisGame==map&&tgot){
    words=new String[1];
    words[0]=("Well done!");
  }
}

void nmouse(){
  inx++;
}
