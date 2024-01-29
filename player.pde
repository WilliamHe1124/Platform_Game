class player extends engine{
  int frame;
  boolean cd=false;
  public boolean reversed=false;
  player(){
    super();
    setPosition(startx, starty);
    setFillColor(green);
    setRotatable(false);
    setRestitution(0);
    setFriction(1);
    attachImage(self[0]);
  }
  
  void act(int vel){
    animate();
    if (aa) {
      reversed=true;
      setVelocity(-200, getVelocityY()); 
    }
    if (dd) {
      if (reversed) {
        
        reversed=false;
      }
      setVelocity(200, getVelocityY());
    }
    if (ww&&!cd) {
      setVelocity(getVelocityX(), vel);
      if (!hll(character, waters)) {
        cd=true;
        vervel=-500;
      } else {
        vervel=-300;
      }
    }
  }

  void touch(){
    
  }
  
  void animate(){
    if (frame>=self.length) frame=0;
    if (frameCount%5==0){
      if (reversed) {
        if (pchosen)attachImage(self[frame]);
        if (dchosen)attachImage(dog[frame]);
      }
      else {
        if (pchosen)attachImage(iself[frame]);
        if (dchosen)attachImage(idog[frame]);
      }
      frame++;
    }
    if (frameCount%70==0){
      if (cd) cd=false;
    }
  }
  
}
