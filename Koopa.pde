class FKoopa extends FGoomba{

  boolean gotHit;
  boolean shellMoving;
  boolean fcd;
  
  public FKoopa(float xx, float yy){
    super(xx, yy);
    gotHit=false;
    shellMoving=false;
    attachImage(kp);
  }
  
  void collision(){
    if (hll(this, walls)) {
      direction*=-1;
      setPosition(getX()+direction, getY());
    }
    if (hl(this, character)){
      if (character.getY()<getY()-gridsize/2){
        if (!gotHit){
          speed=0;
          attachImage(shl);
          gotHit=true;
          fcd=true;
        }
        if (gotHit){
          if (!fcd){
            world.remove(this);
            enemies.remove(this);
          }
        }
        
      } else {
        if (!gotHit) worldReset(thisGame);
        if (gotHit){
          speed=5;
          shellMoving=true;
          fcd=true;
        }
        if (shellMoving){
            if (!fcd)worldReset(thisGame);
        }
      }
    }
    checkFcd();
  }
  
  public void frames(){
    
  }
  
  void checkFcd(){
    if (fcd){
      if (!hl(this, character)&&frameCount%100==0) fcd=false;
    }
  }
  
}
