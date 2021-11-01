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
    public partial class ClubControl : UserControl
    {
        public Club Club { get; private set; }
        public ClubControl(Club club)
        {
            InitializeComponent();
            Club = club;
            pbClub.ImageLocation = Club.Picture;
            lbClubName.Text = Club.ToString();
            pbClub.Left = (this.Width - pbClub.Width) / 2;
            lbClubName.Left = (this.Width - lbClubName.Width) / 2;
        }

        private void ClubControl_Click(object sender, EventArgs e)
        {
            Forms.ClubInfo clubInfo = new Forms.ClubInfo(Club);
            clubInfo.ShowDialog();
            if (clubInfo.Deleted)
                Visible = false;
        }
    }
}
