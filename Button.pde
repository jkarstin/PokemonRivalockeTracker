/* Button.pde
 * 
 * J Karstin Neill    08.13.18
 */

public class Button extends Label {
  
  public Button(Coord position, Coord size, String text) {
    super(position, size, text);
  }
  
  public void hover(Coord position) {
    if (contains(position)) mFillColor = color(150);
    else mFillColor = color(255);
  }
  
  public void hover(float x, float y) {
    this.hover(new Coord(x, y));
  }
  
  public boolean click(Coord position) {
    return contains(position);
  }
  
  public boolean click(float x, float y) {
    return click(new Coord(x, y));
  }
  
  private boolean contains(Coord position) {
    if (position.x() >= mPos.x() &&
        position.x() <= mPos.x()+mSize.x() &&
        position.y() >= mPos.y() &&
        position.y() <= mPos.y()+mSize.y()) {
      return true;
    }
    return false;
  }
};
