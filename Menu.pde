/* Menu.pde
 * 
 * 
 * J Karstin Neill    08.11.18
 */

public class Menu extends Tile {
  private final static int MAXPAGES = 6;
  private Page[] mPages;
  private int mPageCount;
  
  public Menu() {
    super();
    mPages = new Page[MAXPAGES];
    mPageCount = 0;
    //for (int p=0; p < MAXPAGES; p++) mPages[p] = null;
  }
  
  public void addPage(Page page) {
    if (mPageCount < MAXPAGES) mPages[mPageCount++] = page;
  }
  
  public Page getPage(int index) {
    if (index < mPageCount) return mPages[index];
    return null;
  }
  
  public void show() {
    super.show();
  }
};
