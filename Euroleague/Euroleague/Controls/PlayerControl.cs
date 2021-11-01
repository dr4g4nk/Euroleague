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

namespace Euroleague.Controls
{
    public partial class PlayerControl : UserControl
    {
        public Player Player { get; private set; }
        public bool Deleted { get; private set; }
        public bool Reload { get; private set; }

        public PlayerControl(Player player)
        {
            InitializeComponent();
            Deleted = false;
            Reload = false;
            Player = player;
            Fill();
        }

        private void Fill()
        {
            lbName.Text = Player.ToString();
            pbPlayer.ImageLocation = Player.PicturePath;
        }

        private void PlayerControl_Click(object sender, EventArgs e)
        {
            Forms.PlayerInfo playerInfo = new Forms.PlayerInfo(Player);
            playerInfo.ShowDialog();
            Deleted = playerInfo.Deleted;
            Reload = playerInfo.Reload;
            if (Deleted)
                this.Visible = false;
            if (Reload)
            {
                Player = playerInfo.Player;
                Fill();
            }
        }
    }
}
