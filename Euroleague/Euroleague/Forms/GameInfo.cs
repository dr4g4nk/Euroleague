using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Euroleague.Data.Model;
using Euroleague.Data.DataAccess;

namespace Euroleague.Forms
{
    public partial class GameInfo : Form
    {
        public Game Game { get; private set; }
        public bool Deleted { get; private set; }
        private List<PlayerStatistics> playerStatistics;
        private List<PlayerStatistics> playerStatisticsHome;
        private List<PlayerStatistics> playerStatisticsGuest;
        public GameInfo(Game game)
        {
            Deleted = false;
            Game = game;
            InitializeComponent();
            Game.Referees = new MySqlPerson().GetRefereesOnGame(Game.ID);
            pbHomeClub.ImageLocation = Game.HomeClub.Picture;
            pbGuestClub.ImageLocation = Game.GuestClub.Picture;
            lbHomeClub.Text = Game.HomeClub.ToString() + " " + (Game.FirstQuarterH + Game.SecondQuarterH + Game.ThirdQuarterH + Game.FourthQuarterH + Game.OverTimeH);
            lbGuestClub.Text = Game.GuestClub.ToString() + " " + (Game.FirstQuarterG + Game.SecondQuarterG + Game.ThirdQuarterG + Game.FourthQuarterG + Game.OverTimeG);
            pnlByQuarter.Size = new Size(pnlByQuarter.Size.Width, pnlByQuarter.Size.Height + 25);
            dgvByQuarter.Rows.Add(Game.HomeClub.ToString(), Game.FirstQuarterH, Game.SecondQuarterH, Game.ThirdQuarterH, Game.FourthQuarterH, Game.OverTimeH);
            dgvByQuarter.Rows.Add(Game.GuestClub.ToString(), Game.FirstQuarterG, Game.SecondQuarterG, Game.ThirdQuarterG, Game.FourthQuarterG, Game.OverTimeG);
            string referees = "";
            Game.Referees.ForEach(r => referees += r.ToString() + ", ");
            lbReferees.Text = referees;
            lbHomeClubName.Text = Game.HomeClub.ToString();
            lbGuestClubName.Text = Game.GuestClub.ToString();

            GetStatistics();
        }

        private void GetStatistics()
        {

            MySqlPlayerOnGame mySqlPlayerOnGame = new MySqlPlayerOnGame();
            playerStatistics = mySqlPlayerOnGame.GetPlayerStatisticsByGameId(Game.ID);

            playerStatisticsHome = playerStatistics.FindAll(statistic => statistic.Player.Club.Equals(Game.HomeClub));
            playerStatisticsGuest = playerStatistics.FindAll(statistic => statistic.Player.Club.Equals(Game.GuestClub));
            ShowPlayers();
        }
       
        private delegate void Set();
        private void ShowPlayers()
        {
            pnlBoxScoreHome.Size = new Size(pnlBoxScoreHome.Size.Width, pnlBoxScoreHome.Size.Height + playerStatisticsHome.Count * 25);

            playerStatisticsHome.ForEach(statistic => dgvHome.Rows.Add(statistic.Player.Number, statistic.Player, statistic.MIN, statistic.PTS, statistic.FGM + "/" + statistic.FGA,
                statistic._3FGM + "/" + statistic._3FGA, statistic.FTM + "/" + statistic.FTA,
                statistic.OReb, statistic.DReb, statistic.OReb + statistic.DReb, statistic.AS, statistic.BLK, statistic.Fouls));
           
            pnlBoxScoreGuest.Size = new Size(pnlBoxScoreGuest.Size.Width, pnlBoxScoreGuest.Size.Height + playerStatisticsGuest.Count * 25);
            
            playerStatisticsGuest.ForEach(statistic => dgvGuest.Rows.Add(statistic.Player.Number, statistic.Player, statistic.MIN, statistic.PTS, statistic.FGM + "/" + statistic.FGA,
                statistic._3FGM + "/" + statistic._3FGA, statistic.FTM + "/" + statistic.FTA,
                statistic.OReb, statistic.DReb, statistic.OReb + statistic.DReb, statistic.AS, statistic.BLK, statistic.Fouls));
        }

        private void btnAddPlayer_Click(object sender, EventArgs e)
        {
            NewPlayerOnGame newPlayerOnGame = new NewPlayerOnGame(Game);
            newPlayerOnGame.ShowDialog();
            List<PlayerStatistics> homePlayers = newPlayerOnGame.Players.FindAll(p => p.Player.Club.Equals(Game.HomeClub));
            List<PlayerStatistics> guestPlayers = newPlayerOnGame.Players.FindAll(p => p.Player.Club.Equals(Game.GuestClub));

            if (homePlayers.Count > 0)
            {
                pnlBoxScoreHome.Size = new Size(pnlBoxScoreHome.Size.Width, pnlBoxScoreHome.Size.Height + homePlayers.Count * 25);

                homePlayers.ForEach(statistic => dgvHome.Rows.Add(statistic.Player.Number, statistic.Player, statistic.MIN, statistic.PTS,
                    statistic.FGM + "/" + statistic.FGA, statistic._3FGM + "/" + statistic._3FGA, statistic.FTM + "/" + statistic.FTA,
                    statistic.OReb, statistic.DReb, statistic.OReb + statistic.DReb, statistic.AS, statistic.BLK, statistic.Fouls));
            }
            if (guestPlayers.Count > 0)
            {
                pnlBoxScoreGuest.Size = new Size(pnlBoxScoreGuest.Size.Width, pnlBoxScoreGuest.Size.Height + guestPlayers.Count * 25);

                guestPlayers.ForEach(statistic => dgvGuest.Rows.Add(statistic.Player.Number, statistic.Player, statistic.MIN, statistic.PTS,
                    statistic.FGM + "/" + statistic.FGA, statistic._3FGM + "/" + statistic._3FGA, statistic.FTM + "/" + statistic.FTA,
                    statistic.OReb, statistic.DReb, statistic.OReb + statistic.DReb, statistic.AS, statistic.BLK, statistic.Fouls));
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            MySqlGame mySqlGame = new MySqlGame();
            mySqlGame.Delete(Game);
            Deleted = true;
            this.Close();
        }
    }
}
