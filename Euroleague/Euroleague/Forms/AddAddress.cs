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
    public partial class AddAddress : Form
    {
        public AddAddress()
        {
            InitializeComponent();
            FillCbCity();
        }

        private void FillCbCity(State state = null)
        {
            cbCity.Items.Clear();
            cbCity.Text = null;
            cbCity.SelectedItem = null;
            MySqlCity mySqlCity = new MySqlCity();
            List<City> cities = mySqlCity.GetCities();
            if (state != null)
                cities = cities.FindAll(city => city.State.ID == state.ID);
            cities.ForEach(city => cbCity.Items.Add(city));
        }

        private void button2_Click(object sender, EventArgs e)
        {
            AddCity addCity = new AddCity();
            addCity.ShowDialog();
            FillCbCity();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            City city = cbCity.SelectedItem as City;

            if (tbStreet.Text.Length > 0 && city != null)
            {
                MySqlAddress mySqlAddress = new MySqlAddress();
                mySqlAddress.AddAddress(new Address()
                {
                    Street = tbStreet.Text,
                    Num = (int)nudNum.Value,
                    City = city
                });
            }
            this.Close();
        }
    }
}
