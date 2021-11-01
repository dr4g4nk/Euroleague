using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Euroleague.Data.Model;
using MySql.Data.MySqlClient;

namespace Euroleague.Data.DataAccess
{
    class MySqlPhase
    {
        private static readonly string SelectBySeason = @"select * from fazatakmicenja where IdSezone=@IdSezone";

        public List<Phase> GetPhases(Season season)
        {
            List<Phase> phases = new List<Phase>();
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = SelectBySeason;
                cmd.Parameters.AddWithValue("@IdSezone", season.ID);
                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    phases.Add(new Phase()
                    {
                        CompetitionPhase = reader.GetString(0),
                        Season = season
                    });
                }
            }
            catch (Exception e)
            {
                throw new Exception("Greska pri citanju", e);
            }

            return phases;
        }
    }
}
