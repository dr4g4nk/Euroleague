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
    public partial class NewClubForSeason : Form
    {
        private Season Season;
        public Club Club { get; private set; }
        public bool Reload { get; private set; }
        public NewClubForSeason(Season season)
        {
            InitializeComponent();
            Season = season;
            Reload = false;
            MySqlClub mySqlClub = new MySqlClub();
            mySqlClub.GetClubs().ForEach(c => cbClub.Items.Add(c));
        }

        private void button1_Click(object sender, EventArgs e)
        {
            NewClub newClub = new NewClub(Season);
            newClub.ShowDialog();
            if(newClub.Club != null)
            {
                newClub.Club.Season = Season;
                cbClub.Items.Add(newClub.Club);
                cbClub.SelectedItem = newClub.Club;
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            Club = cbClub.SelectedItem as Club;
            if (Club != null)
            {
                MySqlClub mySqlClub = new MySqlClub();
                mySqlClub.InsertClubInSeason(Club.ID, Season.ID);
                Reload = true;
            }
            Close();
        }
    }
}
