/* TextBox.pde
 * 
 * 
 * J Karstin Neill    08.11.18
 */

public class TextBox {
  private Coord mLocation;
  private Coord mSize;
  private String mText;
  private color mTextColor;
  private color mFillColor;
  private color mBorderColor;
  
  public TextBox() {
    mLocation = new Coord();
    mSize = new Coord();
    mText = "";
    mTextColor = color(0);
    mFillColor = color(255);
    mBorderColor = color(0);
  }
  
  public TextBox(Coord location, Coord size) {
    mLocation = location;
    mSize = size;
    mText = "";
    mTextColor = color(0);
    mFillColor = color(255);
    mBorderColor = color(0);
  }
  
  public TextBox(Coord location, Coord size, String text) {
    mLocation = location;
    mSize = size;
    mText = text;
    mTextColor = color(0);
    mFillColor = color(255);
    mBorderColor = color(0);
  }
  
  public void setFillColor(color fillColor) {
    mFillColor = fillColor;
  }
  
  public void setBorderColor(color borderColor) {
    mBorderColor = borderColor;
  }
  
  public void setTextColor(color textColor) {
    mTextColor = textColor;
  }
  
  public void setText(String text) {
    mText = text;
  }
  
  public void move(Coord delta) {
    mLocation.plusEq(delta);
  }
  
  public void setLocation(Coord location) {
    Coord delta = location.minus(mLocation);
    this.move(delta);
  }
  
  public Coord location() {
    return mLocation;
  }
  
  public void show() {
    fill(mFillColor);
    rect(mLocation.x(), mLocation.y(), mSize.x(), mSize.y());
    stroke(mBorderColor);
    noFill();
    rect(mLocation.x(), mLocation.y(), mSize.x(), mSize.y());
    fill(mTextColor);
    text(mText, mLocation.x()+10, mLocation.y()+20);
  }
};
