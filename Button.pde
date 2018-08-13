public class Button extends Tile {
  
  public Button() {
    super();
  }
  
  public Button(float x, float y, float w, float h) {
    super(x, y, w, h);
    mFillColor = color(255);
  }
  
  public boolean click(Coord position) {
    if (position.x() >= mPos.x() &&
        position.x() <= mPos.x()+mSize.x() &&
        position.y() >= mPos.y() &&
        position.y() <= mPos.y()+mSize.y()) {
      return true;
    }
    return false;
  }
  
  public boolean click(float x, float y) {
    return click(new Coord(x, y));
  }
};
