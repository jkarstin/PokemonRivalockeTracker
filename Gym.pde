/* Gym.pde
 * 
 * 
 * J Karstin Neill    08.11.18
 */
 
public class Gym {
  private final static int MAXPLAYERS = 8;
  
  private String mName;
  private Player[] mPlayersInOrder;
  private int mPlayerCount;
  
  public Gym(String name) {
    mName = name;
    mPlayersInOrder = new Player[MAXPLAYERS];
    mPlayerCount = 0;
  }
  
  public void addPlayer(Player player) {
    if (mPlayerCount < MAXPLAYERS) {
      mPlayersInOrder[mPlayerCount++] = player;
    }
  }
  
  public String name() {
    return mName;
  }
  
  public Player first() {
    if (mPlayerCount > 0) return mPlayersInOrder[0];
    return null;
  }
};
