import fisica.*;
import java.util.ArrayList;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minimtool;
AudioPlayer song;
final int intro=0;
final int level=1;
final int game=2;
final int end=3;
final int npc=4;
final int select=5;
int mode=0;
float startx=20;
float starty=0;
FWorld world;
PImage map;
PImage map1;
PImage floor;
PImage lava;
PImage lava2;
PImage water;
PImage stone;
PImage wana;
PImage ice;
PImage tmp;
PImage self[]=new PImage[2];
PImage monster[]=new PImage[2];
PImage iself[]=new PImage[2];
PImage[] dog=new PImage[2];
PImage[] idog=new PImage[2];
PImage bck;
PImage lbck;
PImage swtOn;
PImage swtOff;
PImage port;
PImage tre;
PImage saved;
PImage unsaved;
PImage kp;
PImage shl;
PImage thisGame;
PImage npcha;
PImage endBg;
PImage bll;
PFont pixel;
color black=#000000;
color blue=#4DA6FF;
color red=#DA2B2B;
color white=#FFFFFF;
color purple=#8C3F5D;
color orange=#F2A65E;
color green=#CFFF70;
color lgreen=#66FFE3;
color brown=#904D23;
color grey=#43434F;
color ggreen=#9CD895;
color CSwitch=#2F554E;
color CControlled=#846ABB;
color CPortal=#ECE342;
color CTreasure=#8D2A13;
color CSave=#A6A29F;
color CNpc=#A7A7C8;
color CKoopa=#1AE03E;
int gridsize=32;
int vervel=-600;
float zoom=1.5;
player character;
boolean ww, aa, dd, ss, zz, kg;
boolean onejump=false;
boolean switchOn=false;
boolean telcd=false;
boolean tgot=false;
ArrayList<FBox> lv=new ArrayList();
ArrayList<FBox> fb=new ArrayList();
ArrayList<FBox> waters=new ArrayList();
ArrayList<FGoomba> enemies=new ArrayList();
ArrayList<FBox> walls=new ArrayList();
ArrayList<FBox> portals=new ArrayList();
ArrayList<FBox> switches=new ArrayList();
ArrayList<FBox> removable=new ArrayList();
ArrayList<FBox> treasures=new ArrayList();
ArrayList<FBox> savePoints=new ArrayList();
ArrayList<FBox> npcs=new ArrayList();
ArrayList<FBullet> bullets=new ArrayList();
ArrayList<ArrayList<FBox>> theLists=new ArrayList();
int[] lvtimer;

void setup(){
  size(1000, 600);
  Fisica.init(this);
  map=loadImage("map.png");
  map1=loadImage("map1.png");
  floor=loadImage("normal_block.png");
  lava=loadImage("lava_floor.png");
  water=loadImage("water_floor.png");
  stone=loadImage("stone_block.png");
  wana=loadImage("temp_block.png");
  ice=loadImage("ice_block.png");
  lava2=loadImage("lava_floor2.png");
  tmp=loadImage("trampoline_block.png");
  self[0]=loadImage("self_char.png");
  self[1]=loadImage("self_char1.png");
  dog[0]=loadImage("self_dog.png");
  dog[1]=loadImage("self_dog1.png");
  idog[0]=loadImage("self_dog2.png");
  idog[1]=loadImage("self_dog3.png");
  iself[0]=loadImage("self_char2.png");
  iself[1]=loadImage("self_char3.png");
  monster[0]=loadImage("little_enemy.png");
  monster[1]=loadImage("little_enemy1.png");
  bck=loadImage("pixel_background.jpeg");
  bck.resize(width, height);
  lbck=loadImage("pixel_level.jpeg");
  lbck.resize(width, height);
  swtOn=loadImage("switch_on.png");
  swtOff=loadImage("switch_off.png");
  port=loadImage("portal_app.png");
  tre=loadImage("trea_app.png");
  saved=loadImage("save_yes.png");
  unsaved=loadImage("save_no.png");
  kp=loadImage("koopa.png");
  shl=loadImage("shelled.png");
  npcha=loadImage("npc.png");
  endBg=loadImage("ending_back.jpg");
  endBg.resize(width, height);
  bll=loadImage("bullet_app.png");
  pixel=createFont("Pixeled.ttf", 1);
  thisGame=map;
  theLists.add(walls);
  theLists.add(portals);
  theLists.add(switches);
  theLists.add(removable);
  theLists.add(treasures);
  theLists.add(lv);
  theLists.add(fb);
  theLists.add(savePoints);
  theLists.add(npcs);
  character=new player();
  loadWorld(thisGame);
  lvtimer=new int[lv.size()];
  world.add(character);
  for (int i=0;i<lvtimer.length;i++)
  lvtimer[i]=0;
  //song=minimtool.loadFile("game_opener.wav");
}

void draw(){
  if (mode==intro) Intro();
  else if (mode==level) Level();
  else if (mode==game) Game();
  else if (mode==end) End();
  else if (mode==npc) NPC();
  else if (mode==select) Selection();
  else println("error");
}

void Intro(){
  background(bck);
  fill(white);
  rectMode(CENTER);
  textFont(pixel);
  textSize(30);
  rect(width/2, height*0.75, 300, 100);
  rect(width/4*3+100, height*0.75, 200, 70);
  fill(black);
  text("START", width/2-75, height*0.75+15);
  textSize(11);
  text("character selection", width/4*3+10, height*0.75+5);
  textSize(80);
  fill(purple);
  text("PIXEL IMPACT", width/2-415, height*0.25+35);
}

void imouse(){
  if (mouseX>width/2-150&&mouseX<width/2+150&&mouseY>height*0.75-50&&mouseY<height*0.75+50) mode=level;
  if (mouseX>width/4*3-100&&mouseX<width/4*3+200&&mouseY>height*0.75-35&&mouseY<height*0.75+35) mode=select;
}

void Game(){
  background(#B5F6FC);
  drawWorld();
  character.act(vervel);
  if (lv.size()!=0)checkLava();
  if (fb.size()!=0)checkWana();
  animatedlv();
  for (int i=0;i<enemies.size();i++)
  enemies.get(i).act();
  if (portals.size()!=0)checkPortal();
  if (switches.size()!=0)checkSwitch();
  if (treasures.size()!=0)checkEnd();
  if (savePoints.size()!=0)checkSaved();
  if (npcs.size()!=0)checkNpc();
  if (bullets.size()!=0){
    checkBullet();
    keepBV();
  }
  inx=0;
}

void gmouse(){
  
}

void loadWorld(PImage img){
  world=new FWorld(-2000, -2000, 4000, 2000);
  world.setGravity(0, 1000);
 for (int x=0;x<img.height;x++){
  for (int i=0;i<img.width;i++){
    color c=img.get(i, x);
    if (c==black){
      FBox b=new FBox(gridsize, gridsize);
      b.setPosition(i*gridsize, x*gridsize);
      b.setStatic(true);
      b.attachImage(floor);
      b.setFriction(1);
      world.add(b);
    }
    if (c==blue){
      FBox w=new FBox(gridsize, gridsize);
      w.setPosition(i*gridsize, x*gridsize);
      w.attachImage(water);
      w.setStatic(true);
      w.setSensor(true);
      w.setFriction(1);
      waters.add(w);
      world.add(w);
    }
    if (c==red){
      FBox r=new FBox(gridsize, gridsize);
      r.setPosition(i*gridsize, x*gridsize);
      r.attachImage(lava);
      r.setStatic(true);
      world.add(r);
      lv.add(r);
    }
    if (c==orange){
      FBox o=new FBox(gridsize, gridsize);
      o.setPosition(i*gridsize, x*gridsize);
      o.attachImage(stone);
      o.setFriction(1);
      o.setStatic(true);
      world.add(o);
    }
    if (c==green){
      FBox g=new FBox(gridsize, gridsize);
      g.setPosition(i*gridsize, x*gridsize);
      g.attachImage(wana);
      g.setFriction(1);
      g.setStatic(true);
      world.add(g);
      fb.add(g);
    }
    if (c==purple){
      FBox g=new FBox(gridsize, gridsize);
      g.setPosition(i*gridsize, x*gridsize);
      g.attachImage(tmp);
      g.setRestitution(2);
      g.setFriction(1);
      g.setStatic(true);
      world.add(g);
    }
    if (c==lgreen){
      FBox g=new FBox(gridsize, gridsize);
      g.setPosition(i*gridsize, x*gridsize);
      g.attachImage(ice);
      g.setFriction(0);
      g.setStatic(true);
      world.add(g);
    }
    if (c==grey){
      FGoomba g=new FGoomba(i*gridsize, x*gridsize);
      enemies.add(g);
      world.add(g);
    }
    if (c==ggreen){
      FBox g=new FBox(gridsize, gridsize);
      g.setPosition(i*gridsize, x*gridsize);
      g.attachImage(floor);
      g.setFriction(1);
      g.setStatic(true);
      g.setName("wall");
      walls.add(g);
      world.add(g);
    }
    if (c==CPortal){
      FBox g=new FBox(gridsize, gridsize);
      g.setPosition(i*gridsize, x*gridsize);
      g.setStatic(true);
      g.setFriction(1);
      g.attachImage(port);
      portals.add(g);
      world.add(g);
    }
    if (c==CSwitch){
      FBox g=new FBox(gridsize, gridsize);
      g.setPosition(i*gridsize, x*gridsize);
      g.setStatic(true);
      g.setFriction(1);
      g.attachImage(swtOff);
      switches.add(g);
      world.add(g);
    }
    if (c==CControlled){
      FBox g=new FBox(gridsize, gridsize);
      g.setPosition(i*gridsize, x*gridsize);
      g.setStatic(true);
      g.setFriction(1);
      removable.add(g);
      g.attachImage(wana);
      world.add(g);
    }
    if (c==CTreasure){
      FBox g=new FBox(gridsize, gridsize);
      g.setPosition(i*gridsize, x*gridsize);
      g.setStatic(true);
      g.setSensor(true);
      g.setFriction(0);
      g.attachImage(tre);
      treasures.add(g);
      world.add(g);
    }
    if (c==CSave){
      FBox g=new FBox(gridsize, gridsize);
      g.setPosition(i*gridsize, x*gridsize);
      g.setStatic(true);
      g.setSensor(true);
      g.setFriction(0);
      g.attachImage(unsaved);
      savePoints.add(g);
      world.add(g);
    }
    if (c==CNpc){
      FBox g=new FBox(gridsize, gridsize);
      g.setPosition(i*gridsize, x*gridsize);
      g.setStatic(true);
      g.setSensor(true);
      g.setFriction(0);
      g.attachImage(npcha);
      npcs.add(g);
      world.add(g);
    }
    if (c==CKoopa){
      FKoopa g=new FKoopa(i*gridsize, x*gridsize);
      enemies.add(g);
      world.add(g);
    }
  }
  }
}

void drawWorld(){
  pushMatrix();
  translate(-character.getX()*zoom+width/2, -character.getY()*zoom+height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}

  void keyPressed(){
  if (keyCode=='w' || keyCode=='W') ww=true;
  if (keyCode=='a' || keyCode=='A') aa=true;
  if (keyCode=='s' || keyCode=='S') ss=true;
  if (keyCode=='d' || keyCode=='D') dd=true;
  if (keyCode==' ') kg=true;
  if (keyCode=='z' || keyCode=='Z') zz=true;
}

void keyReleased(){
  if (keyCode=='w' || keyCode=='W') ww=false;
  if (keyCode=='a' || keyCode=='A') aa=false;
  if (keyCode=='s' || keyCode=='S') ss=false;
  if (keyCode=='d' || keyCode=='D') dd=false;
  if (keyCode==' ') kg=false;
  if (keyCode=='z' || keyCode=='Z') zz=false;
  if ((keyCode=='t' || keyCode=='T')&&touchNpc) mode=npc;
  if (keyCode==' ') {
    FBullet b=new FBullet();
    if (character.reversed) b.rol=false;
    else b.rol=true;
    bullets.add(b);
    world.add(b);
  }
}

boolean hl(FBox ground, FBox chara){
  ArrayList<FContact> contactList=chara.getContacts();
  for (int i=0;i<contactList.size();i++){
    FContact mycont=contactList.get(i);
    if (mycont.contains(ground)) return true;
  }
  return false;
}

boolean hll(FBox one, ArrayList<FBox> two){
  for (int i=0;i<two.size();i++){
    ArrayList<FContact> contactList=two.get(i).getContacts();
    for (int x=0;x<contactList.size();x++){
      FContact mycont=contactList.get(x);
      if (mycont.contains(one)) return true;
    }
  }
  return false;
}

void checkLava(){
  for (int i=0;i<lv.size();i++){
   if (hl(lv.get(i), character)) {
     worldReset(thisGame);
   }
  }
}

void checkWana(){
  for (int i=0;i<fb.size();i++){
   if (hl(fb.get(i), character)&&character.getY()<fb.get(i).getY()-gridsize/2) {
     fb.get(i).setStatic(false);
     fb.get(i).setSensor(true);
   }
  }
}

void animatedlv(){
    for (int i=0;i<lv.size();i++){
     if (lvtimer[i]<=100){
       lv.get(i).attachImage(lava);
       lvtimer[i]++;
     }
     if (lvtimer[i]>100){
       lv.get(i).attachImage(lava2);
       lvtimer[i]++;
     }
     if (lvtimer[i]>=200) lvtimer[i]=0;
  }
}

void worldReset(PImage img){
  world.clear();
  for (int i=0;i<theLists.size();i++){
    theLists.get(i).clear();
  }
  enemies.clear();
  bullets.clear();
  loadWorld(img);
  lvtimer=new int[lv.size()];
  for (int i=0;i<lvtimer.length;i++)
  lvtimer[i]=0;
  switchOn=false;
  tgot=false;
  character=new player();
  world.add(character);
}

void mouseReleased(){
  if (mode==intro) imouse();
  else if (mode==level) lmouse();
  else if (mode==game) gmouse();
  else if (mode==end) emouse();
  else if (mode==npc) nmouse();
  else if (mode==select) smouse();
  else println("error");
}
