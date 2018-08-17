/* Keypad.pde
 * 
 * A more effective and organized way to create a large grouping of buttons that are used simply for gathering user input.
 * 
 * J Karstin Neill    08.17.18
 */

public class Keypad extends Tile {
  protected Collection<Button> mButtons;
  
  protected Coord mGridSize;
  protected Coord mButtonSize;
  protected Coord mBufferSize;
  
  public Keypad(Coord position, Coord gridSize) {
    super(position, new Coord());
    mFillColor = color(127);
    mGridSize = gridSize;
    mButtonSize = new Coord(30, 30);
    mBufferSize = new Coord(10, 10);
    updateSize();
    mButtons = new Collection<Button>((int)gridSize.area());
  }
  public Keypad(Coord position, Coord gridSize, Coord buttonSize, Coord bufferSize) {
    super(position, new Coord());
    mFillColor = color(127);
    mGridSize = gridSize;
    mButtonSize = buttonSize;
    mBufferSize = bufferSize;
    updateSize();
    mButtons = new Collection<Button>((int)gridSize.area());
  }
  
  public void setButtonSize(Coord buttonSize) {
    mButtonSize = buttonSize;
    updateSize();
  }
  
  public Button getButton(int index) {
    return mButtons.getElement(index);
  }
  
  public void addButton(String text) {
    //This line is a bit tricky. I recommend looking at the Coord method definitions. Uses mGridSize and Coord.gridPosition() to calculate Button's location within the grid
    Coord buttonPosition = mPos.plus(mBufferSize).plus(mGridSize.gridPosition(mButtonSize.plus(mBufferSize), mButtons.count()));
    Button tmp = new Button(buttonPosition, mButtonSize, text);
    mButtons.addElement(tmp);
  }
  
  public void show() {
    super.show();
    for (int b=0; mButtons.getElement(b) != null; b++) {
      mButtons.getElement(b).show();
    }
  }
  
  private void updateSize() {
    mSize = new Coord(mButtonSize.plus(mBufferSize).times(mGridSize.x()).plus(mBufferSize).x(), mButtonSize.plus(mBufferSize).times(mGridSize.y()).plus(mBufferSize).y());
  }
};
