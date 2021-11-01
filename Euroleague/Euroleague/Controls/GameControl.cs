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

namespace Euroleague.Controls
{
    public partial class GameControl : UserControl
    {
        public Game Game { get; private set; }
        public GameControl(Game game)
        {
            InitializeComponent();
            Game = game;
            MySqlClub mySqlClub = new MySqlClub();
            Game.HomeClub = mySqlClub.GetClubById(Game.HomeClub.ID);
            Game.GuestClub = mySqlClub.GetClubById(Game.GuestClub.ID);
            pbHome.ImageLocation = game.HomeClub.Picture;
            pbGuest.ImageLocation = game.GuestClub.Picture;
            lbHome.Text = game.HomeClub.ToString();
            lbGuest.Text = game.GuestClub.ToString();
            lbHomePTS.Text = (game.FirstQuarterH + game.SecondQuarterH + game.ThirdQuarterH + game.FourthQuarterH + game.OverTimeH).ToString();
            lbGuestPTS.Text = (game.FirstQuarterG + game.SecondQuarterG + game.ThirdQuarterG + game.FourthQuarterG + game.OverTimeG).ToString();
            lbRoundDate.Text = game.Round.ToString() + ". kolo " + game.Time.ToString("dd.MM.yyyy HH:mm");
        }

        private void panel_Click(object sender, EventArgs e)
        {
            Forms.GameInfo gameInfo = new Forms.GameInfo(Game);
            gameInfo.ShowDialog();
            if (gameInfo.Deleted)
                Visible = false;
        }
    }
}
