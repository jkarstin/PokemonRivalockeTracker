/* Coord.pde
 * 
 * The skeletal system of the entire program. A(n) (ideally) comprehensive base
 * structure to allow all program components to communicate and manipulate location and dimension.
 * 
 * J Karstin Neill    08.16.18
 */

public class Coord {
  float mX, mY;
  
  public Coord() {
    mX = 0;
    mY = 0;
  }
  
  public Coord(Coord other) {
    mX = other.x();
    mY = other.y();
  }
  
  public Coord(float x, float y) {
    mX = x;
    mY = y;
  }
  
  public void setX(float x) {
    mX = x;
  }
  
  public void setY(float y) {
    mY = y;
  }
  
  public float x() {
    return mX;
  }
  
  public float y() {
    return mY;
  }
  
  public Coord negate() {
    return this.times(-1);
  }
  
  public Coord plus(Coord other) {
    if (other != null) return new Coord(this.x() + other.x(), this.y() + other.y());
    return null;
  }
  
  public Coord minus(Coord other) {
    return this.plus(other.negate());
  }
  
  public void plusEq(Coord other) {
    if (other != null) {
      mX += other.x();
      mY += other.y();
    }
  }
  
  public Coord times(float mult) {
    return new Coord(mX*mult, mY*mult);
  }
  
  //This is a very weird, but useful method
  //It will multiply the x components and y components of each coord together separately
  //Essentially, creates the Coord: (this.x * other.x, this.y * other.y)
  //Main use is in pairing with gridPosition() to accurately place the new Coord at a position within a grid,
  //as determined by the grid's cell size Coord, and the index of the Coords associated element in a linear array-type structure
  public Coord dualMultiply(Coord other) {
    return new Coord(mX*other.x(), mY*other.y());
  }
  
  //Used when this Coord defines the maximum dimensions of a given grid in number of cells width, and height
  //Used to find the position within this grid using given index within a linear array-type structure
  //Fills row first before moving to next column: (0,0), (1,0), (2,0), ..., (w-1, h-1), (w, h-1), (0, h), ..., (w-2, h), (w-1, h), (w, h)
  public Coord gridPosition(int index) {
    return new Coord(index%(int)mX, index/(int)mX);
  }
  
  public float area() {
    return mX*mY;
  }
  
  public Coord getCopy() {
    return new Coord(mX, mY);
  }
  
  public void cap(Coord TL, Coord BR) {
    //Minimum cap
    if (this.x() < TL.x()) this.mX = TL.x();
    if (this.y() < TL.y()) this.mY = TL.y();
    //Maximum cap
    if (this.x() > BR.x()) this.mX = BR.x();
    if (this.y() > BR.y()) this.mY = BR.y();
  }
  
  public void wrap(Coord TL, Coord BR) {
    //Minimum wrap to maximum
    if (this.x() < TL.x()) this.mX = BR.x()-(TL.x()-this.x());
    if (this.y() < TL.y()) this.mY = BR.y()-(TL.y()-this.y());
    //Maximum warp to minimum
    if (this.x() > BR.x()) this.mX = TL.x()+(this.x()-BR.x());
    if (this.y() > BR.y()) this.mY = TL.y()+(this.y()-BR.y());
  }
  
  public String summary() {
    String output = "";
    
    output += "(" + mX + ", " + mY + ")";
    
    return output;
  }
};
