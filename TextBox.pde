/* TextBox.pde
 * 
 * 
 * J Karstin Neill    08.11.18
 */

public class TextBox extends Tile {
  private String mText;
  private color mTextColor;
  
  public TextBox() {
    super();
    mText = "";
    mTextColor = color(0);
  }
  
  public TextBox(Coord position, Coord size) {
    super(position, size);
    mText = "";
    mTextColor = color(0);
  }
  
  public TextBox(Coord position, Coord size, String text) {
    super(position, size);
    mText = text;
    mTextColor = color(0);
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
