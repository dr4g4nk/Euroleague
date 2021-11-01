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
    public partial class NewGame : Form
    {
        private List<Club> Clubs;
        public Game Game { get; private set; }
        public NewGame()
        {
            InitializeComponent();
            FillCbSeason();
            GetReferees();
            FillcbReferee1();
        }

        private void FillCbSeason()
        {
            cbSeason.Items.Clear();
            cbSeason.SelectedItem = null;
            cbSeason.Text = "Sezona";
            MySqlSeason mySqlSeason = new MySqlSeason();
            mySqlSeason.GetSeasons().ForEach(season => cbSeason.Items.Add(season));
        }

        private void FillCbPhase()
        {
            cbPhase.Items.Clear();
            cbPhase.SelectedItem = null;
            cbPhase.Text = "Faza";
            FillCbRound();
            MySqlPhase mySqlPhase = new MySqlPhase();
            mySqlPhase.GetPhases(cbSeason.SelectedItem as Season).ForEach(phase => cbPhase.Items.Add(phase));
        }

        private void FillCbRound()
        {
            cbRound.Items.Clear();
            cbRound.SelectedItem = null;
            cbRound.Text = "Kolo";
            if (cbPhase.SelectedItem != null)
            {
                MySqlRound mySqlRound = new MySqlRound();
                mySqlRound.GetRounds(cbPhase.SelectedItem as Phase).ForEach(round => cbRound.Items.Add(round));
            }
        }

        private void FillCbHome()
        {
            Club guest = cbGuest.SelectedItem as Club;
            cbHome.Items.Clear();
            if (guest != null)
            {
                Clubs.ForEach(club =>
                {
                    if (!club.Equals(guest))
                        cbHome.Items.Add(club);
                });
            }
            else
            {
                Clubs.ForEach(club => cbHome.Items.Add(club));
            }
        }
        private void FillCbGuest()
        {
            cbGuest.Items.Clear();
            cbGuest.SelectedItem = null;
            cbGuest.Text = "";
            Club home = cbHome.SelectedItem as Club;

            if (home != null)
            {
                Clubs.ForEach(club =>
                {
                    if (!club.Equals(home))
                        cbGuest.Items.Add(club);
                });
            }
            else Clubs.ForEach(club => cbGuest.Items.Add(club));
        }

        private void cbPhase_SelectedValueChanged(object sender, EventArgs e)
        {
            FillCbRound();
        }

        private void cbSeason_SelectedValueChanged(object sender, EventArgs e)
        {
            FillCbPhase();
            MySqlClub mySqlClub = new MySqlClub();
            Clubs = mySqlClub.GetClubsBySeason((cbSeason.SelectedItem as Season).ID);
            FillCbHome();
            FillCbGuest();
        }

        private void cbHome_SelectedValueChanged(object sender, EventArgs e)
        {
            FillCbGuest();
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            Season season = cbSeason.SelectedItem as Season;
            Round round = cbRound.SelectedItem as Round;
            Club home = cbHome.SelectedItem as Club;
            Club guest = cbGuest.SelectedItem as Club;
            DateTime time = new DateTime(dtpDate.Value.Year, dtpDate.Value.Month, dtpDate.Value.Day, dtpTime.Value.Hour, dtpTime.Value.Minute, 0);
            int pcd = Convert.ToInt32(nudH1.Value);
            int pcg = Convert.ToInt32(nudG1.Value);
            int dcd = Convert.ToInt32(nudH2.Value);
            int dcg = Convert.ToInt32(nudG2.Value);
            int tcd = Convert.ToInt32(nudH3.Value);
            int tcg = Convert.ToInt32(nudG3.Value);
            int ccd = Convert.ToInt32(nudH4.Value);
            int ccg = Convert.ToInt32(nudG4.Value);
            int pd = Convert.ToInt32(nudHO.Value);
            int pg = Convert.ToInt32(nudGO.Value);

            Person referee1 = cbReferee1.SelectedItem as Person;
            Person referee2 = cbReferee2.SelectedItem as Person;
            Person referee3 = cbReferee3.SelectedItem as Person;

            int homePTS = pcd + dcd + tcd + ccd + pd;
            int guestPTS = pcg + dcg + tcg + ccg + pg;

            if (homePTS == guestPTS)
                MessageBox.Show("Reultat ne moze biti nerijesen");
            else if (season != null && round != null && home != null && guest != null && referee1 != null && referee2 != null && referee3 != null)
            {
                MySqlGame mySqlGame = new MySqlGame();
                Game game = new Game()
                {
                    Time = time,
                    Round = round,
                    FirstQuarterH = pcd,
                    FirstQuarterG = pcg,
                    SecondQuarterH = dcd,
                    SecondQuarterG = dcg,
                    ThirdQuarterH = tcd,
                    ThirdQuarterG = tcg,
                    FourthQuarterH = ccd,
                    FourthQuarterG = ccg,
                    OverTimeH = pd,
                    OverTimeG = pg,
                    HomeClub = home,
                    GuestClub = guest,
                    Referees = new List<Person>()
                };

                game.Referees.Add(referee1);
                game.Referees.Add(referee2);
                game.Referees.Add(referee3);

                string msg = "";
                int id = mySqlGame.AddGame(game, out msg);
                game.ID = id;
                Game = game;
                if (msg.Length > 0)
                    MessageBox.Show(msg);
                else
                {
                    if (MessageBox.Show("Da li zelite upisati igraci koji su igrali?", "Igraci", MessageBoxButtons.YesNo) == DialogResult.Yes)
                    {
                        NewPlayerOnGame newPlayerOnGame = new NewPlayerOnGame(game);
                        newPlayerOnGame.Show();
                    }
                    this.Close();
                }
            }
            else MessageBox.Show("Niste unijeli sve potrebne podatke");
        }

        private List<Person> referees;
        private void GetReferees()
        {
            MySqlPerson mySqlPerson = new MySqlPerson();
            referees = mySqlPerson.GetPersons(true);
        }

        private void FillcbReferee1()
        {
            cbReferee1.Items.Clear();
            cbReferee1.SelectedItem = null;
            cbReferee1.Text = "";
            Person referee2 = cbReferee2.SelectedItem as Person;
            Person referee3= cbReferee3.SelectedItem as Person;

            if (referee2 != null && referee3 != null)
            {
                referees.ForEach(r =>
                {
                    if (!r.Equals(referee2) && !r.Equals(referee3) && !cbReferee1.Items.Contains(r))
                        cbReferee1.Items.Add(r);
                });
            }
            else
            {
                if (referee2 == null && referee3 == null)
                    referees.ForEach(r => cbReferee1.Items.Add(r));
                else if (referee3 != null)
                {
                    referees.ForEach(r =>
                    {
                        if (!r.Equals(referee3) && !cbReferee1.Items.Contains(r))
                            cbReferee1.Items.Add(r);
                    });
                }
                else if (referee2 != null)
                {
                    referees.ForEach(r =>
                    {
                        if (!r.Equals(referee2) && !cbReferee1.Items.Contains(r))
                            cbReferee1.Items.Add(r);
                    });
                }
            }
        }

        private void FillcbReferee2()
        {
            cbReferee2.Items.Clear();
            cbReferee2.SelectedItem = null;
            cbReferee2.Text = "";
            Person referee1 = cbReferee1.SelectedItem as Person;
            Person referee3 = cbReferee3.SelectedItem as Person;

            if (referee3 != null && referee1 != null)
            {
                referees.ForEach(r =>
                {
                    if (!r.Equals(referee3) && !r.Equals(referee1) && !cbReferee2.Items.Contains(r))
                        cbReferee2.Items.Add(r);
                });
            }
            else
            {
                if (referee3 == null && referee1 == null)
                    referees.ForEach(r => cbReferee2.Items.Add(r));
                else if (referee1 != null)
                {
                    referees.ForEach(r =>
                    {
                        if (!r.Equals(referee1) && !cbReferee2.Items.Contains(r))
                            cbReferee2.Items.Add(r);
                    });
                }
                else if (referee3 != null)
                {
                    referees.ForEach(r =>
                    {
                        if (!r.Equals(referee3) && !cbReferee2.Items.Contains(r))
                            cbReferee2.Items.Add(r);
                    });
                }
            }
        }

        private void FillcbReferee3()
        {
            cbReferee3.Items.Clear();
            cbReferee3.SelectedItem = null;
            cbReferee3.Text = "";
            Person referee2 = cbReferee2.SelectedItem as Person;
            Person referee1 = cbReferee1.SelectedItem as Person;

            if (referee2 != null && referee1 != null)
            {
                referees.ForEach(r =>
                {
                    if (!r.Equals(referee2) && !r.Equals(referee1) && !cbReferee3.Items.Contains(r))
                        cbReferee3.Items.Add(r);
                });
            }
            else
            {
                if (referee2 == null && referee1 == null)
                    referees.ForEach(r => cbReferee3.Items.Add(r));
                else if (referee1 != null)
                {
                    referees.ForEach(r =>
                    {
                        if (!r.Equals(referee1) && !cbReferee3.Items.Contains(r))
                            cbReferee3.Items.Add(r);
                    });
                }
                else if (referee2 != null)
                {
                    referees.ForEach(r =>
                    {
                        if (!r.Equals(referee2) && !cbReferee3.Items.Contains(r))
                            cbReferee3.Items.Add(r);
                    });
                }
            }
        }

        private void btnAddReferee1_Click(object sender, EventArgs e)
        {
            NewPerson newPerson = new NewPerson(true);
            newPerson.ShowDialog();
            GetReferees();
            FillcbReferee1();
            FillcbReferee2();
            FillcbReferee3();
        }

        private void cbReferee1_SelectedValueChanged(object sender, EventArgs e)
        {
            FillcbReferee2();
            FillcbReferee3();
        }

        private void cbReferee2_SelectedValueChanged(object sender, EventArgs e)
        {
            FillcbReferee3();
        }
    }
}
