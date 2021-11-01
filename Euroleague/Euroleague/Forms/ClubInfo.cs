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
    public partial class ClubInfo : Form
    {
        public Club Club { get; private set; }
        public Season Season;
        public bool Deleted { get; private set; }
        public ClubInfo(Club club)
        {
            InitializeComponent();
            Season = club.Season;
            Club = new MySqlClub().GetClubById(club.ID);
            Club.Season = Season;
            Deleted = false;
            Fill();
            ShowPlayers();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            NewClub newClub = new NewClub(Season, Club);
            newClub.ShowDialog();
            Club = newClub.Club;
            Fill();
        }

        private void Fill()
        {
            tbName.Text = Club.Name;
            tbPresident.Text = Club.President.ToString();
            tbAddress.Text = Club.Address.ToString();
            tbPhone.Text = Club.Phone;
            tbTwitter.Text = Club.Twitter;
            tbInstagram.Text = Club.Instagram;
            tbFacebook.Text = Club.Facebook;
            tbYouTube.Text = Club.YouTube;
            tbSite.Text = Club.OfficialWebsite;
            pbClubImg.ImageLocation = Club.Picture;
            tbInfo.Text = Club.Info;
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            MySqlClub mySqlClub = new MySqlClub();
            mySqlClub.DeleteClub(Club.ID, Season.ID);
            Deleted = true;
            this.Close();
        }

        private void btnNewPlayer_Click(object sender, EventArgs e)
        {
            AddPlayer addPlayer = new AddPlayer(Club);
            addPlayer.ShowDialog();
            if (addPlayer.Reload)
            {
                ShowPlayers();
            }
        }
        private void ShowPlayers()
        {
            flpPlayers.Controls.Clear();
            MySqlPlayer mySqlPlayer = new MySqlPlayer();
            mySqlPlayer.GetPlayers(Club, Season).ForEach(player =>
            {
                Controls.PlayerControl playerControl = new Controls.PlayerControl(player);
                flpPlayers.Controls.Add(playerControl);
            });
        }
    }
}
