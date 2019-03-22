
class PartSystem extends ArrayList<Part> {
  
  public void handle() {
    for(int i=size()-1;i>=0;i--) {
      if(!get(i).move()) {
        remove(i);
      }
    }
  }
  
  public void add(float x, float y, int amount, float speed) {
    for(int i=0;i<amount;i++) {
      add(new Part(x,y,speed,(int)random(100,150)));
    }
  }
  
  public void draw() {
    textAlign(CENTER,CENTER);
    textSize(Part.font_size);
    for(Part part : this) {
      fill(part.rgb,opacity);
      text(part.letter,part.x,part.y);
    }
  }
  
}
