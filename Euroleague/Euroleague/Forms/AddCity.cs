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
    public partial class AddCity : Form
    {
        public AddCity()
        {
            InitializeComponent();
            FillCbState();
        }

        private void FillCbState()
        {
            cbStates.Items.Clear();
            cbStates.Text = "";
            cbStates.SelectedItem = null;
            MySqlState mySqlState = new MySqlState();
            mySqlState.GetStates().ForEach(state => cbStates.Items.Add(state));
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            MessageBox.Show(tbName.Text);
            State state = cbStates.SelectedItem as State;
            if(state !=null && tbName.Text.Length>0)
            {
                MySqlCity mySqlCity = new MySqlCity();
                mySqlCity.AddCity(new City()
                {
                    Name = tbName.Text,
                    State = state
                });
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
