/* Page.pde
 * 
 * 
 * J Karstin Neill    08.13.18
 */

public class Page extends Tile {
  private final static int MAXTILES = 32;
  
  private Collection<Tile> mTiles;
  private String mName;
  
  public Page(String name) {
    super(0, 0, width-1, height-1);
    mTiles = new Collection<Tile>(MAXTILES);
    mName = name;
  }
  
  public String name() {
    return mName;
  }
  
  public void addTile(Tile tile) {
    mTiles.addElement(tile);
  }
  
  public void show() {
    super.show();
    for (int t=0; mTiles.getElement(t) != null; t++) {
      mTiles.getElement(t).show();
    }
  }
};
