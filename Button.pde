/* Button.pde
 * 
 * J Karstin Neill    08.13.18
 */

public class Button extends Label {
  private boolean mDisabled;
  private color mDisabledColor;
  private color mEnabledColor;
  
  public Button(Coord position, Coord size, String text) {
    super(position, size, text);
    mDisabled = false;
    mDisabledColor = color(100);
    mEnabledColor  = color(255);
    mFillColor = mEnabledColor;
  }
  
  public boolean isDisabled() {
    return mDisabled;
  }
  
  public void enable() {
    mDisabled = false;
    mFillColor = mEnabledColor;
  }
  
  public void disable() {
    mDisabled = true;
    mFillColor = mDisabledColor;
  }
  
  public void hover(Coord position) {
    if (contains(position)) mFillColor = color(150);
    else mFillColor = color(255);
  }
  
  public boolean click(Coord position) {
    if (!mDisabled) return contains(position);
    return false;
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
