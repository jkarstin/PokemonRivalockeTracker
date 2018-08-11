/* Pokemon.pde
 * 
 * 
 * J Karstin Neill    08.11.18
 */

public class Pokemon {
  private String mName;
  private String mType;
  private String mBreed;
  private String mGender;
  private int mLevel;
  
  public Pokemon(String name, String breed, String type, String gender, int level) {
    mName = name;
    mBreed = breed;
    mType = type;
    mGender = gender;
    mLevel = level;
  }
  
  public String name() {
    return mName;
  }
  
  public void changeName(String newName) {
    mName = newName;
  }
  
  public String breed() {
    return mBreed;
  }
  
  public void changeBreed(String newBreed) {
    mBreed = newBreed;
  }
  
  public String type() {
    return mType;
  }
  
  public void changeType(String newType) {
    mType = newType;
  }
  
  public String gender() {
    return mGender;
  }
  
  //public void changeGender(String newName) {
  //  mName = newName;
  //}
  
  public int level() {
    return mLevel;
  }
  
  public void changeLevel(int newLevel) {
    mLevel = newLevel;
  }
};
