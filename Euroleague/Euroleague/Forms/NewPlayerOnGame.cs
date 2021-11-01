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
    public partial class NewPlayerOnGame : Form
    {
        public Game Game { get; private set; }
        public List<PlayerStatistics> Players { get; private set; }
        public NewPlayerOnGame(Game game)
        {
            Players = new List<PlayerStatistics>();
            InitializeComponent();
            Game = game;
            cbClub.Items.Add(Game.HomeClub);
            cbClub.Items.Add(Game.GuestClub);
        }

        private void ResetControls()
        {
            cbClub.SelectedItem = null;
            cbClub.Text = "";
            FillCbPlayer();
            nud2FGA.Value = 0;
            nud2FGM.Value = 0;
            nud3FGA.Value = 0;
            nud3FGM.Value = 0;
            nudAs.Value = 0;
            nudBlk.Value = 0;
            nudDreb.Value = 0;
            nudOreb.Value = 0;
            nudFTA.Value = 0;
            nudFTM.Value = 0;
            nudStl.Value = 0;
            nudFouls.Value = 0;
            tbMin.Text = "";
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            PlayerStatistics playerStatistics = new PlayerStatistics()
            {
                Player = cbPlayer.SelectedItem as Player,
                Game = this.Game,
                FGM = Convert.ToInt32(nud2FGM.Value),
                FGA = Convert.ToInt32(nud2FGA.Value),
                _3FGM = Convert.ToInt32(nud3FGM.Value),
                _3FGA = Convert.ToInt32(nud3FGA.Value),
                FTM = Convert.ToInt32(nudFTM.Value),
                FTA = Convert.ToInt32(nudFTM.Value),
                AS = Convert.ToInt32(nudAs.Value),
                OReb = Convert.ToInt32(nudOreb.Value),
                DReb = Convert.ToInt32(nudDreb.Value),
                BLK = Convert.ToInt32(nudBlk.Value),
                STL = Convert.ToInt32(nudStl.Value),
                Fouls = Convert.ToInt32(nudFouls.Value),
                MIN = tbMin.Text
            };
            playerStatistics.PTS = playerStatistics.FTM + 3 * playerStatistics._3FGM + 2 * playerStatistics.FGM;

            if (playerStatistics.Player != null)
            {
                MySqlPlayerOnGame mySqlPlayerOnGame = new MySqlPlayerOnGame();
                string msg = mySqlPlayerOnGame.AddPlayerOnGame(playerStatistics);

                if (msg.Length > 0)
                    MessageBox.Show(msg);
                else
                {
                    Players.Add(playerStatistics);
                    MessageBox.Show("Igrac je uspjesno upisan");
                    ResetControls();
                }
            }
        }

        private void FillCbPlayer()
        {
            cbPlayer.Items.Clear();
            cbPlayer.SelectedItem = null;
            cbPlayer.Text = "";
            Club club = cbClub.SelectedItem as Club;
            if (club != null)
            {
                MySqlPlayer mySqlPlayer = new MySqlPlayer();
                mySqlPlayer.GetPlayers(club, Game.Round.Phase.Season).ForEach(player => cbPlayer.Items.Add(player));
            }
        }

        private void cbClub_SelectedValueChanged(object sender, EventArgs e)
        {
            FillCbPlayer();
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
