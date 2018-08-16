/* Player.pde
 * 
 * 
 * J Karstin Neill    08.11.18
 */

public class Player extends Page {
  private Team mTeam;
  
  public Player(String name) {
    super(name);
    mTeam = new Team(name + "'S TEAM");
    Label profileLabel = new Label(new Coord(20, 20), new Coord(350, 30), "Future " + name + "'s PROFILE Page, coming soon!");
    this.addTile(profileLabel);
  }
  
  public void setTeam(Team team) {
    mTeam = team;
  }
  
  public Team team() {
    return mTeam;
  }
  
  public Team copyTeam() {
    Team copy = new Team(mName + "'S TEAM");
    for (int p=0; mTeam.getPokemon(p) != null; p++) {
      Pokemon tmp = mTeam.getPokemon(p);
      copy.addPokemon(new Pokemon(tmp.name(), tmp.breed(), tmp.type(), tmp.gender(), tmp.level()));
    }
    return copy;
  }
  
  public String summary() {
    String output = "";
    
    output += "PLAYER NAME: " + mName + "\n";
    output += mTeam.summary();
    
    return output;
  }
};
