using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Euroleague.Data.Model;
using MySql.Data.MySqlClient;

namespace Euroleague.Data.DataAccess
{
    class MySqlRound
    {
        private static readonly string SelectBySeason = @"select * from kolo where Faza=@Faza and IdSezone=@IdSezone";
        private static readonly string SelectById = @"select * from kolo where IdKola=@IdKola";
       
        public Round GetRoundById(int id)
        {
            Round round = null;

            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = SelectById;
                cmd.Parameters.AddWithValue("@IdKola", id);

                reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    round = new Round()
                    {
                        ID = reader.GetInt32(0),
                        Num = reader.GetInt32(1),
                        Phase = new Phase()
                        {
                            CompetitionPhase = reader.GetString(2),
                        }
                    };
                    MySqlSeason mySqlSeason = new MySqlSeason();
                    mySqlSeason.GetSeasonById(reader.GetInt32(3));
                    
                }
            }
            catch (Exception e)
            {
                throw new Exception("Greska pri citanju", e);
            }

            return round;
        }
        public List<Round> GetRounds(Phase phase)
        {
            List<Round> rounds = new List<Round>();
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = SelectBySeason;
                cmd.Parameters.AddWithValue("@Faza", phase.CompetitionPhase);
                cmd.Parameters.AddWithValue("@IdSezone", phase.Season.ID);

                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    rounds.Add(new Round()
                    {
                        ID = reader.GetInt32(0),
                        Phase = phase,
                        Num = reader.GetInt32(1)
                    });
                }
            }
            catch (Exception e)
            {
                throw new Exception("Greska pri citanju", e);
            }

            return rounds;
        }
    }
}
