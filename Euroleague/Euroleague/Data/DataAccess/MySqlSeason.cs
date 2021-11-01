using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Euroleague.Data.Model;
using MySql.Data.MySqlClient;

namespace Euroleague.Data.DataAccess
{
    public class MySqlSeason
    {
        private static readonly string SelectAll = @"select * from sezona  order by OdDatum desc";
        private static readonly string Insert = @"insert into sezona (OdDatum, DoDatum, Naziv) values (@OdDatum, @DoDatum, @Naziv)";
        private static readonly string SelectById = @"select * from sezona where IdSezone=@IdSezone";

        public Season GetSeasonById(int id)
        {
            Season season = null;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = SelectById;
                cmd.Parameters.AddWithValue("@IdSezone", id);

                reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    season = new Season()
                    {
                        ID = reader.GetInt32(0),
                        Start = reader.GetDateTime(1),
                        End = reader.GetDateTime(2),
                        Name = reader.GetString(3)
                    };
                }
            }
            catch (Exception e)
            {
                throw new Exception("Greska pri citanju", e);
            }
            return season;
        }

        public List<Season> GetSeasons()
        {
            List<Season> seasons = new List<Season>();
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = SelectAll;
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    seasons.Add(new Season()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(3)
                    });
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

            seasons.Sort(Season.Compare);

            return seasons;
        }

        public void AddSeason(Season season)
        {

            MySqlConnection conn = null;
            MySqlCommand cmd;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = Insert;
                cmd.Parameters.AddWithValue("@OdDatum", season.Start);
                cmd.Parameters.AddWithValue("@DoDatum", season.End);
                cmd.Parameters.AddWithValue("@Naziv", season.Name);
                cmd.ExecuteNonQuery();
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
