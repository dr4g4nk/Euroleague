using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Euroleague.Data.Model;
using MySql.Data.MySqlClient;

namespace Euroleague.Data.DataAccess
{
    public class MySqlCity
    {
        private static readonly string SelectAll = @"select g.IdGrada, g.Naziv, d.IdDrzave, d.Naziv from grad g inner join drzava d on g.idDrzave=d.IdDrzave";
        private static readonly string Insert = @"insert into grad (Naziv, idDrzave) values (@Naziv, @IdDrzave)";
        private static readonly string SelectOne = @"select IdGrada from grad where Naziv=@Naziv and idDrzave=@IdDrzave";
        public List<City> GetCities()
        {
            List<City> cities = new List<City>();
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try{
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = SelectAll;
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    cities.Add(new City()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        State = new State()
                        {
                            ID = reader.GetInt32(2),
                            Name = reader.GetString(3)
                        }
                    });
                }
            }
            catch (Exception e)
            {
                throw new Exception("Greska pri citanju", e);
            }

            return cities;
        }

        public int? GetCityID(City city)
        {
            int? id = null;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = SelectOne;
                cmd.Parameters.AddWithValue("@Naziv", city.Name);
                cmd.Parameters.AddWithValue("@IdDrzave", city.State.ID);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    id = reader.GetInt32(0);
                }
            } catch(Exception e)
            {
                throw new Exception("Greska", e);
            }
            finally
            {
                MySqlConn.CloseReader(reader);
                MySqlConn.CloseConn(conn);
            }
            return id;
        }
        public void AddCity(City city)
        {
            if (GetCityID(city) == null)
            {
                MySqlConnection conn = null;
                MySqlCommand cmd;

                try
                {
                    conn = MySqlConn.GetConnection();
                    cmd = conn.CreateCommand();
                    cmd.CommandText = Insert;
                    cmd.Parameters.AddWithValue("@Naziv", city.Name);
                    cmd.Parameters.AddWithValue("@IdDrzave", city.State.ID);
                    int i = cmd.ExecuteNonQuery();
                }
                catch (Exception e)
                {
                    throw new Exception("Greska", e);
                }
                finally
                {
                    MySqlConn.CloseConn(conn);
                }
            }
        }
    }
}
