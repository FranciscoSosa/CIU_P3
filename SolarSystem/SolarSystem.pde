//import gifAnimation.*;

PImage space;
float ang;
float ang2;

//GifMaker gifFile;
//int count;

void setup(){
  size(600, 600, P3D);
  stroke(0);
  
  imageMode(CORNER);
  space = loadImage("img/space.jpg");
  
  //gifFile = new GifMaker(this, "animacion.gif");
  //count = 0;
  
  ang = 0;
  ang2 = 0;
  
}

void draw(){
  background(0);
  
  //se traslada la imagen -width/2 en la coordenada z para que los planetas no se pongan 
  //por detrás de la imagem, luego -200, -200 para que la imagen ocupe la pantalla
  pushMatrix();
  translate(-200, -200, -width/2);
  image(space, 0, 0);
  popMatrix();
  
  translate(width/2, height/2, 0);
  
  createStar(50, ang, Rotation.Y, "SS-100");
  createPlanet(new SpaceObject(20, -width*0.15, 0, 0, Rotation.Y, ang), "PX-22"); 
  createPlanet(new SpaceObject(20, -width*0.25, 0, 0, Rotation.Y, ang), "PX-11");
  createPlanet(new SpaceObject(10, -width*0.35, 0, 0, Rotation.Y, ang2), "PX-33"); 
  createPlanet(new SpaceObject(20, width*0.2, 0, 0, Rotation.Z, ang), "PX-44");
  createPlanetSatellite(new SpaceObject(20, 0, -height*0.25, 0, Rotation.X, ang), "PX-55",
                       new SpaceObject(5, 0, -height*0.05, 0, Rotation.Z, ang2));
  
  ang+=0.25;
  if (ang > 360)
    ang = 0;
  
  ang2+=0.5;
  if (ang > 360)
    ang = 0; 
  
  /*
  if (count % 50 == 0)
    gifFile.addFrame();
  
  count++;
  */
}

//método para crear la estrella del sistema 
void createStar(int size, float angle, Rotation rotation, String name){
  pushMatrix();
  text(name, -size/2, -size - 5);
  switch(rotation){
    case X:
      rotateX(radians(angle));
      break;
    case Y:
      rotateY(radians(angle));
      break;
    case Z:
      rotateZ(radians(angle));
      break;
  }
  sphere(size);
  popMatrix();
}

//método que crea un planeta y las transaformaciones que se desean aplicar 
void createPlanet(SpaceObject planet, String name){
  pushMatrix();
  switch(planet.getRotation()){
    case X:
      rotateX(radians(planet.getAngle()));
      break;
    case Y:
      rotateY(radians(planet.getAngle()));
      break;
    case Z:
      rotateZ(radians(planet.getAngle()));
      break;
  }
  translate(planet.getPosX(), planet.getPosY(), planet.getPosZ());
  text(name, -planet.getSize()/2 - name.length(), -planet.getSize() - 5);
  sphere(planet.getSize());
  popMatrix();
}

//método para crear un planeta con su satélite
void createPlanetSatellite(SpaceObject planet, String name, SpaceObject satellite){
  pushMatrix();
  switch(planet.getRotation()){
    case X:
      rotateX(radians(planet.getAngle()));
      break;
    case Y:
      rotateY(radians(planet.getAngle()));
      break;
    case Z:
      rotateZ(radians(planet.getAngle()));
      break;
  }
  translate(planet.getPosX(), planet.getPosY(), planet.getPosZ());
  text(name, -planet.getSize()/2 - name.length(), -planet.getSize() - 5);
  sphere(planet.getSize());
  
  pushMatrix();
  switch(satellite.getRotation()){
    case X:
      rotateX(radians(satellite.getAngle()));
      break;
    case Y:
      rotateY(radians(satellite.getAngle()));
      break;
    case Z:
      rotateZ(radians(satellite.getAngle()));
      break;
  }
  translate(satellite.getPosX(), satellite.getPosY(), satellite.getPosZ());
  box(satellite.getSize());
  popMatrix();
  popMatrix();
}


/*
void mousePressed(){
  gifFile.finish();
}
*/
