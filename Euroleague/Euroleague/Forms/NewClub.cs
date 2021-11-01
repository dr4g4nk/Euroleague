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
    public partial class NewClub : Form
    {
        public Club Club { get; private set; }
        private Season Season { get; set; }
        public NewClub(Season season, Club club = null)
        {
            InitializeComponent();
            FillCbAddresses();
            FillCbPresidents();
            Club = club;
            Season = season;
            if(club != null)
            {
                tbName.Text = club.Name;
                cbPresidents.SelectedItem = club.President;
                cbPresidents.Text = club.President.ToString();
                cbAddresses.SelectedItem = club.Address;
                cbAddresses.Text = club.Address.ToString();
                tbPhone.Text = club.Phone;
                tbTwitter.Text = club.Twitter;
                tbInstagram.Text = club.Instagram;
                tbFacebook.Text = club.Facebook;
                tbYouTube.Text = club.YouTube;
                tbSite.Text = club.OfficialWebsite;
                pbClubImg.ImageLocation = club.Picture;
                tbInfo.Text = club.Info;
            }
        }

        private void FillCbPresidents()
        {
            cbPresidents.Items.Clear();
            MySqlPerson mySqlPerson = new MySqlPerson();
            mySqlPerson.GetPersons().ForEach(p => cbPresidents.Items.Add(p));
        }

        private void FillCbAddresses(City city = null)
        {
            cbAddresses.Items.Clear();
            cbAddresses.Text = null;
            cbAddresses.SelectedItem = null;
            MySqlAddress mySqlAddress = new MySqlAddress();
            List<Address> addresses = mySqlAddress.GetAddresses();
            if (city != null)
                addresses = addresses.FindAll(address => address.City.ID == city.ID);
            addresses.ForEach(address => cbAddresses.Items.Add(address));
        }
        private void btnAddClubImg_Click(object sender, EventArgs e)
        {
            if (ofdClubImg.ShowDialog() == DialogResult.OK)
            {
                pbClubImg.ImageLocation = ofdClubImg.FileName;
            }
        }

        private void btnAddAddress_Click(object sender, EventArgs e)
        {
            AddAddress addAddress = new AddAddress();
            addAddress.ShowDialog();
            FillCbAddresses();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            bool close = true;
            Address address = cbAddresses.SelectedItem as Address;
            Person president = cbPresidents.SelectedItem as Person;
            string info = tbInfo.Text == null ? "" : tbInfo.Text;
            string phone = tbPhone.Text == null ? "" : tbPhone.Text;
            string twitter = tbTwitter.Text == null ? "" : tbTwitter.Text;
            string instagram = tbInstagram.Text == null ? "" : tbInstagram.Text;
            string facebook = tbFacebook.Text == null ? "" : tbFacebook.Text;
            string youtube = tbYouTube.Text == null ? "" : tbYouTube.Text;
            string site = tbSite.Text == null ? "" : tbSite.Text;
            string img = pbClubImg.ImageLocation == null ? "" : pbClubImg.ImageLocation;
            Club club = new Club()
            {
                Name = tbName.Text,
                Address = address,
                President = president,
                Info = info,
                Phone = phone,
                Twitter = twitter,
                Instagram = instagram,
                Facebook = facebook,
                YouTube = youtube,
                OfficialWebsite = site,
                Picture = img
            };
            if(tbName.Text.Length > 0 && address!=null && president != null && img.Length > 0)
            {
                MySqlClub mySqlClub = new MySqlClub();
                if (Club == null)
                {
                    club.ID = mySqlClub.AddClub(club);
                }
                else
                {
                    club.ID = Club.ID;
                    string result = mySqlClub.UpdateClub(club);
                    if (result != "")
                    {
                        MessageBox.Show(result);
                        close = false;
                    }
                }
                Club = club;
            }
            if(close)
                this.Close();
        }

        private void btnAddPresident_Click(object sender, EventArgs e)
        {
            NewPerson newPresident = new NewPerson();
            newPresident.ShowDialog();
            FillCbPresidents();
        }
    }
}
