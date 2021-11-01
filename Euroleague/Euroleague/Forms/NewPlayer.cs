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

namespace Euroleague.Forms
{
    public partial class NewPlayer : Form
    {
        public Player Player { get; private set; }
        public bool Reload { get; private set; }
        public NewPlayer(Player player = null)
        {
            Reload = false;
            InitializeComponent();
            FillCbState();

            if(player != null)
            {
                Player = player;

                tbName.Text = player.Name;
                tbSurname.Text = player.Surname;
                cbState.SelectedItem = player.State;
                cbState.Text = player.State.ToString();
                dtpBorn.Value = player.Born;
                dtpBorn.Text = player.Born.ToString();
                nudHeight.Value = player.Height;
                tbPosition.Text = player.Position;
                pbPlayer.ImageLocation = player.PicturePath;
                tbBio.Text = player.Bio;
            }
        }
        private void FillCbState()
        {
            cbState.Items.Clear();
            cbState.Text = null;
            cbState.SelectedItem = null;
            MySqlState mySqlState = new MySqlState();
            List<State> states = mySqlState.GetStates();
            states.ForEach(state => cbState.Items.Add(state));
        }
        private void btnPicture_Click(object sender, EventArgs e)
        {
            if(ofdPicture.ShowDialog() == DialogResult.OK)
            {
                pbPlayer.ImageLocation = ofdPicture.FileName;
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            string name = tbName.Text;
            string surname = tbSurname.Text;
            DateTime born = dtpBorn.Value;
            decimal height = nudHeight.Value;
            string position = tbPosition.Text;
            string picture = pbPlayer.ImageLocation == null ? "" : pbPlayer.ImageLocation;
            string bio = tbBio.Text == null ? "" : tbBio.Text;

            if (name.Length>0 && surname.Length > 0 && cbState.SelectedItem != null)
            {
                MySqlPlayer mySqlPlayer = new MySqlPlayer();
                Player player = new Player()
                {
                    Name = name,
                    Surname = surname,
                    Born = born,
                    PicturePath = picture,
                    Height = height,
                    Position = position,
                    Bio = bio,
                    State = cbState.SelectedItem as State,
                };
                if (Player == null)
                {
                    int id = mySqlPlayer.AddPlayer(player);
                    player.ID = id;
                    Reload = true;
                }
                else
                {
                    player.ID = Player.ID;
                    player.Club = Player.Club;
                    mySqlPlayer.UpdatePlayer(player);
                    if (!Player.Name.Equals(player.Name) || !Player.Surname.Equals(player.Surname) || !Player.PicturePath.Equals(player.PicturePath))
                        Reload = true;
                }
                Player = player;
            }
            this.Close();
        }

        private void btnAddState_Click(object sender, EventArgs e)
        {
            AddState addState = new AddState();
            addState.ShowDialog();
            FillCbState();
        }
    }
}
