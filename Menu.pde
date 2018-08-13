/* Menu.pde
 * 
 * 
 * J Karstin Neill    08.11.18
 */

public class Menu extends Tile {
  private final static int MAXPAGES = 6;
  private Button[] mButtons;
  private Page[] mPages;
  private int mPageCount;
  
  public Menu(float x, float y, float w, float h) {
    super(x, y, w, h);
    mFillColor = color(127);
    mButtons = new Button[MAXPAGES];
    mPages = new Page[MAXPAGES];
    mPageCount = 0;
  }
  
  public void addPage(Page page) {
    if (mPageCount < MAXPAGES) {
      mButtons[mPageCount] = new Button(mPos.x()+10, mPos.y()+10+50*mPageCount, mSize.x()-20, 40);
      mPages[mPageCount++] = page;
    }
  }
  
  public void move(Coord delta) {
    super.move(delta);
    for (int b=0; b < mPageCount; b++) mButtons[b].move(delta);
  }
  
  public Button getButton(int index) {
    if (index < mPageCount) return mButtons[index];
    return null;
  }
  
  public Page getPage(int index) {
    if (index < mPageCount) return mPages[index];
    return null;
  }
  
  public void show() {
    super.show();
    for (int b=0; b < mPageCount; b++) {
      mButtons[b].show();
    }
  }
};
