/* Tile.pde
 * 
 * This is the base visualization component of the program.
 * Everything that will be drawn to the screen will be either
 * an instance of the Tile class, or an instance of one of the Tile class's children classes.
 * 
 * This provides a uniform way to handle position and size manipulation of every on-screen
 * component. Every class that "extends Tile" will be moveable, and resizable using the same class methods.
 * 
 * To call this class's constructor from a child's constructor, use the built-in method super().
 * 
 * J Karstin Neill    08.16.18
 */

public class Tile {
  //Protected fields
  protected Coord mPos;
  protected Coord mSize;
  
  protected color mFillColor;
  protected color mBorderColor;
  
  //Public constructor methods
  public Tile() {
    mPos  = new Coord();
    mSize = new Coord();
    mFillColor   = color(0);
    mBorderColor = color(0);
  }
  public Tile(Coord position, Coord size) {
    mPos  = position.getCopy();
    mSize =     size.getCopy();
    mFillColor   = color(0);
    mBorderColor = color(0);
  }
  
  public Coord pos() {
    return mPos;
  }
  
  public float x() {
    return mPos.x();
  }
  
  public float y() {
    return mPos.y();
  }
  
  public Coord dim() {
    return mSize;
  }
  
  public float width() {
    return mSize.x();
  }
  
  public float height() {
    return mSize.y();
  }
  
  //Adds given delta coordinate to this tile's position coordinate to simulate movement
  public void move(Coord delta) {
    mPos.plusEq(delta);
    mPos.wrap(mSize.negate(), new Coord(width, height));
  }
  
  public void setPosition(Coord position) {
    Coord delta = position.minus(mPos);
    this.move(delta);
  }
  
  public void grow(Coord delta) {
    mSize.plusEq(delta);
  }
  
  public void setSize(Coord size) {
    Coord delta = size.minus(mSize);
    this.grow(delta);
  }
  
  public void setFillColor(color fillColor) {
    mFillColor = fillColor;
  }
  
  public void setBorderColor(color borderColor) {
    mBorderColor = borderColor;
  }
  
  //Display object on screen
  public void show() {
    fill(mFillColor);
    stroke(mBorderColor);
    rect(mPos.x(), mPos.y(), mSize.x(), mSize.y());
  }
};
