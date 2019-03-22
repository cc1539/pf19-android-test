final int IPF = 1;
final float opacity = sqrt(1./IPF)*255;

PartSystem ps = new PartSystem();
int time_pressed;

int getStrength() {
  return max(0,frameCount-time_pressed);
}

void setup() {
  //fullScreen(P2D);
  size(480,640,P2D);
  ((PGraphicsOpenGL)g).textureSampling(3);
  textFont(createFont("comic sans ms",24));
}

void mousePressed() {
  time_pressed = frameCount;
}

void mouseReleased() {
  int str = getStrength();
  ps.add(mouseX,mouseY,100+str,100+str);
}

void draw() {
  
  if(mousePressed) {
    
    int str = getStrength();
  
    background(255-min(max(0,str-420)/5,255));
    
    float d = 360;
    noStroke();
    if(str<255) {
      fill(255,255-str,255-str);
      ellipse(mouseX,mouseY,d,d);
    } else {
      fill(255,0,0);
      float angle = random(0,TWO_PI);
      float range = sqrt(random(0,1))*min((str-255)/10,180);
      ellipse(
          mouseX+range*cos(angle),
          mouseY+range*sin(angle),
          d,d);
    }
    
  } else {
    background(255);
  }
  
  for(int i=0;i<IPF;i++) {
    ps.handle();
    ps.draw();
  }
  
}
