/* Pokemon.pde
 * 
 * 
 * J Karstin Neill    08.16.18
 */

public class Pokemon extends Page {
  private PokeData.Type   mType;
  //private PokeData.Breed  mBreed;
  private String          mBreed;
  private PokeData.Gender mGender;
  private int mLevel;

  public Pokemon(String name, String breed, PokeData.Type type, PokeData.Gender gender, int level) {
    super(name);
    mBreed = breed;
    mType = type;
    mGender = gender;
    mLevel = level;
    Label profileLabel = new Label(new Coord(20, 20), new Coord(350, 30), "Future " + name + "'s POKEMON PROFILE Page, coming soon!");
    this.addTile(profileLabel);
  }
  
  //public Pokemon(String name, PokeData.Breed breed, PokeData.Type type, PokeData.Gender gender, int level) {
  //  super(name);
  //  mBreed = breed;
  //  mType = type;
  //  mGender = gender;
  //  mLevel = level;
  //  Label profileLabel = new Label(new Coord(20, 20), new Coord(350, 30), "Future " + name + "'s POKEMON PROFILE Page, coming soon!");
  //  this.addTile(profileLabel);
  //}
  
  public void changeName(String newName) {
    mName = newName;
  }

  public String breed() {
    return mBreed;
  }
  
  public void changeBreed(String newBreed) {
    mBreed = newBreed;
  }
  
  //public PokeData.Breed breed() {
  //  return mBreed;
  //}
  
  //public void changeBreed(PokeData.Breed newBreed) {
  //  mBreed = newBreed;
  //}
  
  public PokeData.Type type() {
    return mType;
  }
  
  public void changeType(PokeData.Type newType) {
    mType = newType;
  }
  
  public PokeData.Gender gender() {
    return mGender;
  }
  
  public int level() {
    return mLevel;
  }
  
  public void changeLevel(int newLevel) {
    mLevel = newLevel;
  }
  
  public String summary() {
    String output = "";
    
    output += "NAME:   " + mName + "\n";
    output += "BREED:  " + mBreed + "\n";
    output += "TYPE:   " + mType + "\n";
    output += "GENDER: " + mGender + "\n";
    output += "LEVEL:  " + mLevel + "\n";
    
    return output;
  }
};
