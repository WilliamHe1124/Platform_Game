void checkPortal(){
  if (hl(portals.get(0), character)&&!telcd&&character.getY()<portals.get(0).getY()){
    character.setPosition(portals.get(1).getX(), portals.get(1).getY()-gridsize);
    character.setVelocity(0, 0);
    telcd=true;
  }
  if (telcd){
    if (!hl(portals.get(0), character)&&!hl(portals.get(1), character)) {
      if (character.getX()!=portals.get(0).getX()&&character.getX()!=portals.get(1).getX())telcd=false;
    }
  }
  if (hl(portals.get(1), character)&&!telcd&&character.getY()<portals.get(1).getY()) {
    character.setPosition(portals.get(0).getX(), portals.get(0).getY()-gridsize);
    character.setVelocity(0, 0);
    telcd=true;
  }
}
