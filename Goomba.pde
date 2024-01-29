class FGoomba extends engine{
  
  int direction=L;
  int speed;
  int frame;
  
  FGoomba(float x, float y){
    super();
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
    attachImage(monster[0]);
    speed=3;
  }
  
  public void act(){
    move();
    frames();
    collision();
  }

  public void frames(){
    if (frame>=monster.length) frame=0;
    if (frameCount%5==0){
      attachImage(monster[frame]);
      frame++;
    }
  }
  
  public void move(){
    float y=getVelocityY();
    setVelocity(speed*direction*12, y);
  }
  
  void collision(){
    if (hll(this, walls)) {
      direction*=-1;
      setPosition(getX()+direction, getY());
    }
    if (hl(this, character)){
      if (character.getY()<getY()-gridsize/2){
        world.remove(this);
        enemies.remove(this);
      } else {
        worldReset(thisGame);
      }
    }
  }
}
