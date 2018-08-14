/* Page.pde
 * 
 * 
 * J Karstin Neill    08.13.18
 */

public class Page extends Tile {
  protected final static int MAXTILES   = 64;
  protected final static int MAXMENUS   = 8;
  protected final static int MAXBUTTONS = 32;
  
  protected Collection<Tile>   mTiles;
  protected Collection<Button> mButtons;
  protected Collection<Menu>   mMenus;
  protected String mName;
  
  public Page(String name) {
    super(new Coord(), new Coord(width-1, height-1));
    mTiles   = new Collection<Tile>(MAXTILES);
    mMenus   = new Collection<Menu>(MAXMENUS);
    mButtons = new Collection<Button>(MAXBUTTONS);
    mName = name;
  }
  
  public String name() {
    return mName;
  }
  
  public Menu getMenu(int index) {
    return mMenus.getElement(index);
  }
  
  public Button getButton(int index) {
    return mButtons.getElement(index);
  }
  
  public void addButton(Button button) {
    mButtons.addElement(button);
    this.addTile(button);
  }
  
  //Adds given menu to both menu collection and tile collection
  public void addMenu(Menu menu) {
    mMenus.addElement(menu);
    this.addTile(menu);
  }
  
  //Adds given generic tile to tile collection
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
