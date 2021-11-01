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

namespace Euroleague.Forms
{
    public partial class AddSeason : Form
    {
        public AddSeason()
        {
            InitializeComponent();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (tbName.Text.Length > 0) {
                MySqlSeason mySqlSeason = new MySqlSeason();
                mySqlSeason.AddSeason(new Data.Model.Season()
                {
                    Name = tbName.Text,
                    Start = dtpStart.Value,
                    End = dtpEnd.Value
                });
            }
            this.Close();
        }
    }
}
