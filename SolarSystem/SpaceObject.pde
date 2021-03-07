//Clase que representa las características de un planeta o un satélite
class SpaceObject{
  private final int size;
  private final float posX;
  private final float posY;
  private final float posZ;
  private final Rotation rotation;
  private float angle;
  
  SpaceObject(int size, float posX, float posY, float posZ, Rotation rotation, float angle){
    this.size = size;
    this.posX = posX;
    this.posY = posY;
    this.posZ = posZ;
    this.rotation = rotation;
    this.angle = angle;
  }
  
  public int getSize(){
    return size;
  }
  
  public float getPosX(){
    return posX;
  }
  
  public float getPosY(){
    return posY;
  }
  
  public float getPosZ(){
    return posZ;
  }
  
  public Rotation getRotation(){
    return rotation;
  }
  
  public float getAngle(){
    return angle;
  }
}
