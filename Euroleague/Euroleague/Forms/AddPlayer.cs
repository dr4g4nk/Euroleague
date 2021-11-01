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
    public partial class AddPlayer : Form
    {

        public Club Club { get; private set; }
        public bool Reload { get; private set; }
        public Player Player { get; private set; }
        public AddPlayer(Club club)
        {
            InitializeComponent();
            Club = club;
            MySqlPlayer mySqlPlayer = new MySqlPlayer();
            mySqlPlayer.GetAllPlayers().ForEach(p => cbPlayer.Items.Add(p));
        }

        private void button1_Click(object sender, EventArgs e)
        {
            NewPlayer newPlayer = new NewPlayer();
            newPlayer.ShowDialog();
            Reload = newPlayer.Reload;
            if (newPlayer.Player != null)
            {
                cbPlayer.Items.Add(newPlayer.Player);
                cbPlayer.SelectedItem = newPlayer.Player;
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            Player = cbPlayer.SelectedItem as Player;
            if (Player != null)
            {
                Player.Club = Club;
                Player.Number = Convert.ToInt32(nudNum.Value);
                MySqlPlayer mySqlPlayer = new MySqlPlayer();
                mySqlPlayer.AddPlayerClub(Player);
                Reload = true;
            }
            nudNum.Value = 0;
            cbPlayer.ResetText();
            cbPlayer.SelectedItem = null;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
