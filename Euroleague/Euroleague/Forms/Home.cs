using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Euroleague.Data.DataAccess;
using Euroleague.Data.Model;
using Euroleague.Forms;
using MySql.Data.MySqlClient;

namespace Euroleague
{
    public partial class Home : Form
    {
        private List<Club> Clubs;
        private readonly int height;
        public Home()
        {
            InitializeComponent();
            height = pnlStanding.Size.Height;
            MySqlSeason mySqlSeason = new MySqlSeason();
            List<Season> seasons = mySqlSeason.GetSeasons();
            if (seasons.Count > 0) {
                seasons.ForEach(s =>
               {
                   cbSeason.Items.Add(s);
                   cbSeasonGames.Items.Add(s);
                   cbSeasonClub.Items.Add(s);
               });
                Season season = seasons.ElementAt(0);
                cbSeason.SelectedItem = season;
                cbSeasonGames.SelectedItem = season;
                cbSeasonClub.SelectedItem = season;
            }
        }

        private void cbSeason_SelectedValueChanged(object sender, EventArgs e)
        {
            dgvStanding.Rows.Clear();
            Season season = cbSeason.SelectedItem as Season;
            Clubs = new MySqlClub().GetClubsBySeason(season.ID);
            pnlStanding.Size = new Size(pnlStanding.Size.Width, height + Clubs.Count * 25);
            int i = 1;
            Clubs.Sort(Club.Compare);
            Clubs.ForEach(club => dgvStanding.Rows.Add(i++, club, club.W, club.L, club.PTSplus, club.PTSminus, club.PTSplus - club.PTSminus));
        }

        private void btnNewGame_Click(object sender, EventArgs e)
        {
            NewGame newGame = new NewGame();
            newGame.ShowDialog();
            Phase phase = cbPhase.SelectedItem as Phase;
            if (newGame.Game != null && phase.Equals(newGame.Game.Round.Phase))
            {
                Euroleague.Controls.GameControl gameControl = new Controls.GameControl(newGame.Game);
                flpGames.Controls.Add(gameControl);
            }
        }

        private void tb_Resize(object sender, EventArgs e)
        {
            pnlStanding.Left = (tb.ClientSize.Width - pnlStanding.Width) / 2;
        }

        private void cbSeasonGames_SelectedValueChanged(object sender, EventArgs e)
        {
            cbPhase.Items.Clear();
            cbPhase.Text = "Faza";
            MySqlPhase mySqlPhase = new MySqlPhase();
            List<Phase> phases = mySqlPhase.GetPhases(cbSeasonGames.SelectedItem as Season);
            phases.Sort(Phase.Compare);
            phases.ForEach(p => cbPhase.Items.Add(p));
            if (phases.Count > 0)
                cbPhase.SelectedItem = phases.Last();
            else
            {
                cbPhase.SelectedItem = null;
                ShowGames();
            }
        }

        private void cbPhase_SelectedValueChanged(object sender, EventArgs e)
        {
            ShowGames();
        }

        private void ShowGames()
        {
            flpGames.Controls.Clear();
             Phase phase = cbPhase.SelectedItem as Phase;
             if (phase != null)
             {
                 MySqlGame mySqlGame = new MySqlGame();
                 List<Game> games = mySqlGame.GetGamesByPhase(phase);
                 games.Sort(Game.Compare);
                 games.ForEach(game =>
                 {
                     Euroleague.Controls.GameControl gameControl = new Controls.GameControl(game);
                     flpGames.Controls.Add(gameControl);
                 });
             }
        }

        private void cbSeasonClub_SelectedValueChanged(object sender, EventArgs e)
        {
            flpClubs.Controls.Clear();
            Season season = cbSeasonClub.SelectedItem as Season;
            List<Club> clubs = new MySqlClub().GetClubsBySeason(season.ID);
            clubs.ForEach(club =>
            {
                club.Season = season;
                Euroleague.Controls.ClubControl clubControl = new Controls.ClubControl(club);
                flpClubs.Controls.Add(clubControl);
            });
        }

        private void btnNewClub_Click(object sender, EventArgs e)
        {
            Season season = cbSeasonClub.SelectedItem as Season;
            NewClubForSeason newClub = new NewClubForSeason(season);
            newClub.ShowDialog();

            if (newClub.Club != null)
            {
                newClub.Club.Season = season;
                Euroleague.Controls.ClubControl clubControl = new Controls.ClubControl(newClub.Club);
                flpClubs.Controls.Add(clubControl);
            }
        }
    }
}
