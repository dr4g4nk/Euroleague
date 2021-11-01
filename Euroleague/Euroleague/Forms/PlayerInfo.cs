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
    public partial class PlayerInfo : Form
    {
        public Player Player { get; private set; }
        public bool Reload { get; private set; }
        public bool Deleted { get; private set; }

        private List<PlayerStatistics> statistics;
        public PlayerInfo(Player player)
        {
            InitializeComponent();
            Deleted = false;
            Reload = false;
            Club tmp = player.Club;
            Player = new MySqlPlayer().GetPlayerByIdClubAndSeason(player.ID, player.Club.ID, player.Club.Season.ID);
            Player.Club = tmp;
            lbBio.Text = player.Bio;
            Fill();
            FillCbPhase();

            MySqlPlayerOnGame mySqlPlayerOnGame = new MySqlPlayerOnGame();
            statistics = mySqlPlayerOnGame.GetPlayerStatistics(Player.ID, Player.Club.Season.ID);
            statistics.ForEach(statistic =>
            dgvStatistics.Rows.Add(statistic.Game.Round.Phase.CompetitionPhase, statistic.Game.Round.Num, statistic.Game, statistic.MIN, statistic.PTS, statistic.FGM + "/" +
                    statistic.FGA, statistic._3FGM + "/" + statistic._3FGA, statistic.FTM + "/" + statistic.FTA, statistic.AS, statistic.OReb,
                    statistic.DReb, statistic.BLK, statistic.STL, statistic.Fouls));
        }

        private void Fill()
        {
            pbPlayer.ImageLocation = Player.PicturePath;
            lbName.Text = Player.ToString();
            pbClub.ImageLocation = Player.Club.Picture;
            lbClubInfo.Text = Player.Club.ToString() + " | " + Player.Number + " | " + Player.Position;
            lbPlayerInfo.Text = "Visina: " + Player.Height + " | Datum rodjenja: " + Player.Born.ToString("dd.MM.yyyy") + " | Drzava: " + Player.State.ToString();
        }

        private void FillCbPhase()
        {
            MySqlPhase mySqlPhase = new MySqlPhase();
            mySqlPhase.GetPhases(Player.Club.Season).ForEach(phase => cbPhase.Items.Add(phase));
            FillCbRound();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            NewPlayer updatePlayer = new NewPlayer(Player);
            updatePlayer.ShowDialog();
            Player = updatePlayer.Player;
            Reload = updatePlayer.Reload;
            Fill();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            MySqlPlayer mySqlPlayer = new MySqlPlayer();
            string msg = mySqlPlayer.DeletePlayer(Player);
            if (msg.Length > 0)
            {
                MessageBox.Show(msg);
            }
            else
            {
                this.Close();
                Deleted = true;
            }
        }

        private void cbPhase_SelectedValueChanged(object sender, EventArgs e)
        {
            FillCbRound();
        }

        private void FillCbRound()
        {
            cbRound.Items.Clear();
            cbRound.SelectedItem = null;
            cbRound.Text = "Kolo";
            FillCbGame();
            Phase phase = cbPhase.SelectedItem as Phase;
            if (phase != null)
            {
                MySqlRound mySqlRound = new MySqlRound();
                mySqlRound.GetRounds(cbPhase.SelectedItem as Phase).ForEach(round => cbRound.Items.Add(round));
            }
        }

        private void cbRound_SelectedValueChanged(object sender, EventArgs e)
        {
            FillCbGame();
        }

        private void FillCbGame()
        {
            cbGame.Items.Clear();
            cbGame.SelectedItem = null;
            cbGame.Text = "Utakmica";
            Round round = cbRound.SelectedItem as Round;
            if (round != null) {
                MySqlGame mySqlGame = new MySqlGame();
                Game game = mySqlGame.GetGameByClubAndRoundId(Player.Club.ID, round.ID);
                if (game != null)
                {
                    cbGame.Items.Add(game);
                    cbGame.SelectedItem = game;
                    cbGame.Text = game.ToString();
                }
            }
        }

        private void Add_Click(object sender, EventArgs e)
        {
            PlayerStatistics playerStatistics = new PlayerStatistics()
            {
                Player = this.Player,
                Game = cbGame.SelectedItem as Game,
                FGM = Convert.ToInt32(nud2fgm.Value),
                FGA = Convert.ToInt32(nud2fga.Value),
                _3FGM = Convert.ToInt32(nud3fgm.Value),
                _3FGA = Convert.ToInt32(nud3fga.Value),
                FTM = Convert.ToInt32(nudFtm.Value),
                FTA = Convert.ToInt32(nudFta.Value),
                AS = Convert.ToInt32(nudAs.Value),
                OReb = Convert.ToInt32(nudOreb.Value),
                DReb = Convert.ToInt32(nudDreb.Value),
                BLK = Convert.ToInt32(nudBlk.Value),
                STL = Convert.ToInt32(nudStl.Value),
                Fouls = Convert.ToInt32(nudFouls.Value),
                MIN = tbMin.Text
            };
            playerStatistics.Game.Round = cbRound.SelectedItem as Round;
            playerStatistics.PTS = playerStatistics.FTM + 3*playerStatistics._3FGM + 2*playerStatistics.FGM;

            if (playerStatistics.Game != null)
            {
                MySqlPlayerOnGame mySqlPlayerOnGame = new MySqlPlayerOnGame();
                string msg = mySqlPlayerOnGame.AddPlayerOnGame(playerStatistics);

                if (msg.Length > 0)
                    MessageBox.Show(msg);
                else
                {
                    dgvStatistics.Rows.Add(playerStatistics.Game.Round.Phase.CompetitionPhase,
                        playerStatistics.Game.Round.Num,
                        playerStatistics.Game, playerStatistics.MIN, playerStatistics.PTS, playerStatistics.FGM + "/" +
                        playerStatistics.FGA, playerStatistics._3FGM + "/" + playerStatistics._3FGA, playerStatistics.FTM + "/" + playerStatistics.FTA, playerStatistics.AS, playerStatistics.OReb,
                        playerStatistics.DReb, playerStatistics.BLK, playerStatistics.STL, playerStatistics.Fouls);

                    statistics.Add(playerStatistics);
                }
            }
        }

        private void dgvStatistics_UserDeletedRow(object sender, DataGridViewRowEventArgs e)
        {
            //dgvStatistics.sele
        }

        private void dgvStatistics_UserDeletingRow(object sender, DataGridViewRowCancelEventArgs e)
        {
            int num = Convert.ToInt32(dgvStatistics.SelectedRows[0].Cells[1].Value);

            MySqlPlayerOnGame mySqlPlayerOnGame = new MySqlPlayerOnGame();
            mySqlPlayerOnGame.DeletePlayerOnGame(Player.ID, statistics.Find(s => s.Game.Round.Num == num).Game.ID);
        }
    }
}
