
class Part {
  
  static final String palette =
      "abcdefghijklmnopqrstuvwxyz"+
      "ABCDEFGHIJKLMNOPQRSTUVWXYZ"+
      "0123456789";
  
  float x;
  float y;
  float vx;
  float vy;
  
  static final float inertia = 0.9;
  static final float font_size = 72;
  
  int lifetime;
  
  color rgb;
  char letter;
  
  Part(float x, float y, float speed, int lifetime) {
    
    this.x = x;
    this.y = y;
    
    float angle = random(0,TWO_PI);
    float range = sqrt(random(0,1))*speed;
    vx = range*cos(angle)/IPF;
    vy = range*sin(angle)/IPF;
    
    this.lifetime = lifetime*IPF;
    
    letter = palette.charAt((int)random(0,palette.length()));
    rgb = color(random(0,200),random(0,200),random(0,200));
  }
  
  boolean move() {
    if(--lifetime==0) {
      return false;
    } else {
      if((x+=vx*=inertia)!=(x=min(max(x,font_size/2),width -font_size/2))) { vx=-vx; }
      if((y+=vy*=inertia)!=(y=min(max(y,font_size/2),height-font_size/2))) { vy=-vy; }
    }
    return true;
  }
  
}
