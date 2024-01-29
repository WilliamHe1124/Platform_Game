class FBullet extends engine{
  public boolean rol;
  public FBullet(){
    super();
    setSensor(true);
    setPosition(character.getX(), character.getY());
    attachImage(bll);
  }
  
}

void checkBullet(){
  for (int i=0; i<bullets.size(); i++){
    for (int x=0; x<enemies.size(); x++){
      if (i<bullets.size()){
      if (hl(enemies.get(x), bullets.get(i))) {
        if (!(enemies.get(x) instanceof FKoopa)){
        world.remove(enemies.get(x));
        enemies.remove(x);
        }
        world.remove(bullets.get(i));
        bullets.remove(i);
        break;
      }
      }
      //if (bullets.get(i).getVelocityX()<100) {
      //  bullets.remove(i);
      //}
    }
      
  }
}

void keepBV(){
  for (int i=0;i<bullets.size();i++){
    bullets.get(i).setVelocity(bullets.get(i).getVelocityX(), -bullets.get(i).getVelocityY()-15);
    if (bullets.get(i).rol) bullets.get(i).setVelocity(500, bullets.get(i).getVelocityY());
     else bullets.get(i).setVelocity(-500, bullets.get(i).getVelocityY());
  }
  
}
