Particle[] normies;
float angle = 0;
boolean direction = true;
void setup()
{
  size(500, 500);
  background(0);
  normies = new Particle[100];
  for (int i = 0; i < normies.length; i++) {
    normies[i] = new NormalParticle();
  }
  normies[normies.length - 1] = new OddballParticle();
  for (int i = 2; i < 5; i++) {
    normies[normies.length - i] = new JumboParticle();
  }
}
void draw()
{
  background(0);
  for (int i = 0; i < normies.length; i++) {
    normies[i].show();
    normies[i].move();
  }
  angle += 0.02;
}
class NormalParticle implements Particle
{
  double myX, myY, myAngle, mySpeed, mySizeOffset;
  color myColor;
  NormalParticle() {
    myX = 250;
    myY = 250;
    myAngle = (Math.random()*2)*Math.PI;
    mySpeed = (Math.random()*5)+0.000001;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    mySizeOffset = ((int)(Math.random()*4)+ 8);
  }
  public void move() {
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
    myAngle = myAngle + 0.02;
  }
  public void show() {
    stroke(0);
    fill(myColor);
    ellipse((float)myX, (float)myY, (float)mySizeOffset + (cos(angle + PI) * (float)mySizeOffset) + (float)mySizeOffset, (float)mySizeOffset + (cos(angle + PI) * (float)mySizeOffset) + (float)mySizeOffset);
  }
}
interface Particle
{
  public void move();
  public void show();
}
class OddballParticle implements Particle
{
  double myX, myY, myAngle, mySpeed;
  int myDirection;
  color myColor;
  OddballParticle() {
    myX = 25;
    myY = 250;
    mySpeed = 10;
    myAngle = Math.PI/4;
    myColor = color(255, 255, 255);
  }
  public void move() {
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
    if (myX <=  10 + (cos(angle + PI) * 10) + 10) {
      myAngle = Math.PI/4;
    } else if (myY >= 500 - (10 + (cos(angle + PI) * 10) + 10)) {
      myAngle = 7*Math.PI/4;
    } else if (myX >= 500 - (10 + (cos(angle + PI) * 10) + 10)) {
      myAngle = 5*Math.PI/4;
    } else if (myY <= 10 + (cos(angle + PI) * 10) + 10) {
      myAngle = 3*Math.PI/4;
    }
  }
  public void show() {
    noStroke();
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    fill(myColor);
    ellipse((float)myX, (float)myY, 10 + (cos(angle + PI) * 10) + 10,  10 + (cos(angle + PI) * 10) + 10);
  }
}
class JumboParticle extends NormalParticle

{
  public void show(){
    stroke(0);
    fill(myColor);
    ellipse((float)myX, (float)myY, 23 + (cos(angle + PI) * 23) + 23, 23 + (cos(angle + PI) * 23) + 23);
  }
}
