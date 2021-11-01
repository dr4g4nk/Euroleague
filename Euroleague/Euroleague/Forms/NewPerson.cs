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
    public partial class NewPerson : Form
    {
        bool Referee;
        public NewPerson(bool referee = false)
        {
            InitializeComponent();
            FillCbState();
            Referee = referee;
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
        private void btnAddState_Click(object sender, EventArgs e)
        {
            AddState addState = new AddState();
            addState.ShowDialog();
            FillCbState();
        }

        private void btnPicture_Click(object sender, EventArgs e)
        {
            if(ofdPersonPicture.ShowDialog() == DialogResult.OK)
            {
                pbPersonPicture.ImageLocation = ofdPersonPicture.FileName;
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (tbName.Text.Length > 0 && tbSurname.Text.Length > 0 && cbState.SelectedItem != null)
            {
                Person person = new Person()
                {
                    Name = tbName.Text,
                    Surname = tbSurname.Text,
                    State = cbState.SelectedItem as State,
                    Born = dtpDate.Value,
                    PicturePath = pbPersonPicture.ImageLocation == null ? "" : pbPersonPicture.ImageLocation
                };
                MySqlPerson mySqlPerson = new MySqlPerson();
                bool b;
                if (!Referee)
                {
                    b = mySqlPerson.AddPerson(person);
                }
                else
                {
                    b = mySqlPerson.AddPerson(person, true);
                }
                if (b)
                {
                    MessageBox.Show("Uspjesno ste dodali novu osobu.");
                }
                else
                {
                    MessageBox.Show("Greska pri upisu", "Greska");
                }
            }
            this.Close();
        }
    }
}
