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
    public partial class AddState : Form
    {
        public AddState()
        {
            InitializeComponent();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if(tbStateName.Text.Length > 0)
            {
                State state = new State()
                {
                    Name = tbStateName.Text
                };
                MySqlState mySql = new MySqlState();
                mySql.AddState(state);
            }
            this.Close();
        }
    }
}
