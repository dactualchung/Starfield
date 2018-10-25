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
  fill(0,0,0,10);
  rect(0,0,500,500);
  for (int i = 0; i < normies.length; i++) {
    normies[i].show();
    normies[i].move();
  }
  angle += 0.02;
}
class NormalParticle implements Particle
{
  double myX, myY, myAngle, mySpeed, mySizeOffset, myOriginalAngle;
  color myColor;
  NormalParticle() {
    myX = 250;
    myY = 250;
    myAngle = myOriginalAngle = (Math.random()*2)*Math.PI;
    mySpeed = (Math.random()*5)+0.000001;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    mySizeOffset = ((int)(Math.random()*2)+ 10);
  }
  public void move() {
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
    if (myAngle <= 2*PI + myOriginalAngle && direction == true) {
      myAngle = myAngle + 0.02;
    } else if (myAngle > 2*PI + myOriginalAngle) {
      direction = false;
    }
    if (direction == false) {
      myAngle = myAngle - 0.02;
      if (myAngle < myOriginalAngle) {
        direction = true;
      }
    }
  }
  public void show() {
    noStroke();
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
    noStroke();
    fill(myColor);
    ellipse((float)myX, (float)myY, 10 + (cos(angle + PI) * 38) + 38, 10 + (cos(angle + PI) * 38) + 38);
  }
}
