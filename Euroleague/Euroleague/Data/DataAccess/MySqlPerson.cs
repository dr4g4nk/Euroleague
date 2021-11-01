using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Euroleague.Data.Model;
using MySql.Data.MySqlClient;

namespace Euroleague.Data.DataAccess
{
    public class MySqlPerson
    {
        private static readonly string SelectAllPresidents = @"select o.* from osoba o inner join predsjednik p on p.IdOsobe=o.IdOsobe";
        private static readonly string InsertPresident = @"insertPresident";
        private static readonly string SelectAllReferee = @"select o.* from osoba o inner join sudija p on p.IdOsobe=o.IdOsobe";
        private static readonly string InsertReferee = @"insertReferee";
        private static readonly string SelectRefereesOnGame = @"select * from referee where IdUtakmice=@id";

        public bool AddPerson(Person person, bool referee = false)
        {
            bool isSaved = false;

            MySqlConnection conn = null;
            MySqlCommand cmd;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                if (referee)
                    cmd.CommandText = InsertReferee;
                else
                    cmd.CommandText = InsertPresident;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ime", person.Name);
                cmd.Parameters.AddWithValue("@prezime", person.Surname);
                cmd.Parameters.AddWithValue("@datumRodjenja", person.Born);
                cmd.Parameters.AddWithValue("@slika", person.PicturePath);
                cmd.Parameters.AddWithValue("@drzava", person.State.ID);

                cmd.ExecuteNonQuery();
                isSaved = true;
            }
            catch (Exception e)
            {
                throw new Exception("Greska", e);
            }
            finally
            {
                MySqlConn.CloseConn(conn);
            }

            return isSaved;
        }

        public List<Person> GetPersons(bool referee = false)
        {
            List<Person> persons = new List<Person>();
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                if (referee)
                    cmd.CommandText = SelectAllReferee;
                else
                    cmd.CommandText = SelectAllPresidents;
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Person p = new Person()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        Surname = reader.GetString(2),
                        Born = reader.GetDateTime(3),
                        PicturePath = reader.GetString(4),
                    };
                    persons.Add(p);
                }
            }
            catch (Exception e)
            {
                throw new Exception("Greska", e);
            }
            finally
            {
                MySqlConn.CloseReader(reader);
                MySqlConn.CloseConn(conn);
            }

            return persons;
        }

        public List<Person> GetRefereesOnGame(int gameId)
        {
            List<Person> persons = new List<Person>();
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = SelectRefereesOnGame;
                cmd.Parameters.AddWithValue("@id", gameId);
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Person p = new Person()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(2),
                        Surname = reader.GetString(3),
                        Born = reader.GetDateTime(4),
                        PicturePath = reader.GetString(5),
                    };
                    persons.Add(p);
                }
            }
            catch (Exception e)
            {
                throw new Exception("Greska", e);
            }
            finally
            {
                MySqlConn.CloseReader(reader);
                MySqlConn.CloseConn(conn);
            }

            return persons;
        }
    }
}
