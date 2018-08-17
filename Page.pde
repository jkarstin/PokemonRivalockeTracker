/* Page.pde
 * 
 * 
 * J Karstin Neill    08.16.18
 */

public class Page extends Tile {
  protected final static int MAXTILES   = 64;
  protected final static int MAXBUTTONS = 32;
  protected final static int MAXKEYPADS =  4;
  protected final static int MAXMENUS   =  8;
  
  protected Collection<Tile>   mTiles;
  protected Collection<Button> mButtons;
  protected Collection<Keypad> mKeypads;
  protected Collection<Menu>   mMenus;
  protected String mName;
  
  public Page(String name) {
    super(new Coord(), new Coord(width-1, height-1));
    mTiles   = new Collection<Tile>(MAXTILES);
    mButtons = new Collection<Button>(MAXBUTTONS);
    mKeypads = new Collection<Keypad>(MAXKEYPADS);
    mMenus   = new Collection<Menu>(MAXMENUS);
    mName = name;
  }
  
  public void rename(String name) {
    mName = name;
  }
  
  public String name() {
    return mName;
  }

  public Button getButton(int index) {
    return mButtons.getElement(index);
  }

  public Keypad getKeypad(int index) {
    return mKeypads.getElement(index);
  }

  public Menu getMenu(int index) {
    return mMenus.getElement(index);
  }
  
  //Adds given generic tile to tile collection
  public void addTile(Tile tile) {
    mTiles.addElement(tile);
  }
  
  public void addButton(Button button) {
    mButtons.addElement(button);
    this.addTile(button);
  }
  
  public void addKeypad(Keypad keypad) {
    mKeypads.addElement(keypad);
    this.addTile(keypad);
  }
  
  //Adds given menu to both menu collection and tile collection
  public void addMenu(Menu menu) {
    mMenus.addElement(menu);
    this.addKeypad(menu);
  }
  
  public void show() {
    super.show();
    for (int t=0; mTiles.getElement(t) != null; t++) {
      mTiles.getElement(t).show();
    }
  }
};
