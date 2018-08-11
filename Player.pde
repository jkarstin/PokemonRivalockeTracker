/* Player.pde
 * 
 * 
 * J Karstin Neill    08.11.18
 */

public class Player {
  private String mName;
  private Team mTeam;
  
  public Player(String name) {
    mName = name;
    mTeam = new Team();
  }
  
  public String name() {
    return mName;
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
