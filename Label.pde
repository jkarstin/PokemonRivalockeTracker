/* Label.pde
 * 
 * 
 * J Karstin Neill    08.16.18
 */

public class Label extends Tile {
  private String mText;
  private color mTextColor;
  
  public Label() {
    super();
    mText = "";
    mFillColor = color(255);
    mTextColor = color(0);
  }
  
  public Label(Coord position, Coord size, String text) {
    super(position, size);
    mText = text;
    mFillColor = color(255);
    mTextColor = color(0);
  }
  
  public String getText() {
    return mText;
  }
  
  public void setTextColor(color textColor) {
    mTextColor = textColor;
  }
  
  public void setText(String text) {
    mText = text;
  }
  
  public void show() {
    super.show();
    fill(mTextColor);
    text(mText, mPos.x()+10, mPos.y()+20);
  }
};
