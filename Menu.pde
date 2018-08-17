/* Menu.pde
 * 
 * A keypad child designed to link buttons to pages to make page selection interactive.
 * 
 * J Karstin Neill    08.16.18
 */

public class Menu extends Keypad {
  private Collection<Page> mPages;
  
  public Menu(Coord position, Coord buttonSize, int maxPages) {
    super(position, new Coord(1, maxPages), buttonSize, new Coord(10, 10));
    mPages = new Collection<Page>(maxPages);
  }
  
  //Create a button for the page, and add the page and its corresponding button to the collections
  public void addPage(Page page) {
    this.addButton(page.name());
    mPages.addElement(page);
  }
  
  public Page getPage(int index) {
    return mPages.getElement(index);
  }
  
  public Page removePage(int index) {
    mButtons.removeElement(index);
    return mPages.removeElement(index);
  }
  
  public void wipe() {
    mButtons.wipe();
    mPages.wipe();
  }
  
  public int pageCount() {
    return mPages.count();
  }
};
