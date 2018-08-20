public class Input {
  private Coord mMousePosPrev;
  private Coord mMousePos;
  
  public Input() {
    mMousePosPrev = new Coord();
    mMousePos = new Coord();
  }
  
  public void updateMouse(float mX, float mY) {
    mMousePosPrev = mMousePos;
    mMousePos = new Coord(mX, mY);
  }
  
  public void keyPressEvent(char keyValue) {
    
  }
};
