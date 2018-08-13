/* Menu.pde
 * 
 * A tile child designed to link buttons to pages to make page selection interactive.
 * 
 * J Karstin Neill    08.13.18
 */

public class Menu extends Tile {
  private final static int MAXPAGES = 6;
  private Collection<Button> mButtons;
  private Collection<Page>   mPages;
  
  public Menu(float x, float y, float w, float h) {
    super(x, y, w, h);
    mFillColor = color(127);
    mButtons = new Collection<Button>(MAXPAGES);
    mPages   = new Collection<Page>(MAXPAGES);
  }
  
  //Create a button for the page, and add the page and its corresponding button to the collections
  public void addPage(Page page) {
    int currentPageIndex = mPages.count();
    Button tmp = new Button(mPos.x()+10, mPos.y()+10+50*currentPageIndex, mSize.x()-20, 40);
    tmp.setText(page.name());
    mButtons.addElement(tmp);
    mPages.addElement(page);
  }
  
  public void move(Coord delta) {
    super.move(delta);
    for (int b=0; mButtons.getElement(b) != null; b++) mButtons.getElement(b).move(delta);
  }
  
  public Button getButton(int index) {
    return mButtons.getElement(index);
  }
  
  public Page getPage(int index) {
    return mPages.getElement(index);
  }
  
  public void show() {
    super.show();
    for (int b=0; mButtons.getElement(b) != null; b++) {
      mButtons.getElement(b).show();
    }
  }
};
