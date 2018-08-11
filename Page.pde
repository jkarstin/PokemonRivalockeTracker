/* Page.pde
 * 
 * 
 * J Karstin Neill    08.11.18
 */

public class Page {
  private final static int MAXTEXTBOXES = 32;
  
  private TextBox[] mTextBoxes;
  private int mTextBoxCount;
  
  public Page() {
    mTextBoxes = new TextBox[MAXTEXTBOXES];
    mTextBoxCount = 0;
  }
  
  public void addTextBox(TextBox textBox) {
    if (mTextBoxCount < MAXTEXTBOXES) {
      mTextBoxes[mTextBoxCount++] = textBox;
    }
  }
  
  public void show() {
    for (int t=0; t < mTextBoxCount; t++) {
      mTextBoxes[t].show();
    }
  }
};
