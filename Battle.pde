/* Battle.pde
 * 
 * 
 * J Karstin Neill    08.11.18
 */

public class Battle {
  private Gym mGym;
  private Player mWinner;
  private Player mLoser;
  private Team mWinningTeam;
  private Team mLosingTeam;
  
  public Battle(Gym gym, Player player1, Player player2, boolean player1won) {
    mGym = gym;
    if (player1won) {
      mWinner = player1;
      mLoser = player2;
    } else {
      mWinner = player2;
      mLoser = player1;
    }
    mWinningTeam = mWinner.copyTeam();
    mLosingTeam = mLoser.copyTeam();
  }
  
  public Gym gym() {
    return mGym;
  }
  
  public Player winner() {
    return mWinner;
  }
  
  public Player loser() {
    return mLoser;
  }
  
  public Team winningTeam() {
    return mWinningTeam;
  }
  
  public Team losingTeam() {
    return mLosingTeam;
  }
  
  public String summary() {
    String output = "";
    
    output += "GYM: " + mGym.name() + "\n";
    output += "PLAYERS: " + mWinner.name() + " VS " + mLoser.name() + "\n";
    output += "WINNER: " + mWinner.name() + " !!!\n";
    
    return output;
  }
};
