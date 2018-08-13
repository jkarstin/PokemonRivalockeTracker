/* Player.pde
 * 
 * 
 * J Karstin Neill    08.11.18
 */

public class Player {
  private String mName;
  private Team mTeam;
  private Page mProfilePage;
  
  public Player(String name) {
    mName = name;
    mTeam = new Team();
    mProfilePage = new Page(name + " PROFILE");
    Label profileLabel = new Label(new Coord(20, 20), new Coord(350, 30), "Future " + name + "'s PROFILE Page, coming soon!");
    mProfilePage.addTile(profileLabel);
  }
  
  public String name() {
    return mName;
  }
  
  public Page profilePage() {
    return mProfilePage;
  }
  
  public Team team() {
    return mTeam;
  }
  
  public Team copyTeam() {
    Team copy = new Team();
    for (int p=0; mTeam.getPokemon(p) != null; p++) {
      Pokemon tmp = mTeam.getPokemon(p);
      copy.addPokemon(new Pokemon(tmp.name(), tmp.breed(), tmp.type(), tmp.gender(), tmp.level()));
    }
    return copy;
  }
};
