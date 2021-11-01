using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Euroleague.Data.Model;
using MySql.Data.MySqlClient;

namespace Euroleague.Data.DataAccess
{
    class MySqlPlayerOnGame
    {
        private static readonly string Insert = @"insertPlayerStatistic";
        private static readonly string Select = @"getPlayerStatistics";
        private static readonly string SelectPlayersByGameId = @"select * from playersongame where IdUtakmice=@id";
        private static readonly string Delete = @"delete from igracnautakmici where IdOsobe=@idOsobe and IdUtakmice=@idUtakmice";

        public List<PlayerStatistics> GetPlayerStatisticsByGameId(int gameId)
        {
            List<PlayerStatistics> playerStatistics = new List<PlayerStatistics>();
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = SelectPlayersByGameId;

                cmd.Parameters.AddWithValue("@id", gameId);

                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    PlayerStatistics statistics = new PlayerStatistics()
                    {
                        PTS = reader.GetInt32(2),
                        MIN = reader.GetString(3),
                        FGM = reader.GetInt32(4),
                        FGA = reader.GetInt32(5),
                        _3FGM = reader.GetInt32(6),
                        _3FGA = reader.GetInt32(7),
                        FTM = reader.GetInt32(8),
                        FTA = reader.GetInt32(9),
                        AS = reader.GetInt32(10),
                        OReb = reader.GetInt32(11),
                        DReb = reader.GetInt32(12),
                        BLK = reader.GetInt32(13),
                        STL = reader.GetInt32(14),
                        Fouls = reader.GetInt32(15),
                        Player = new Player()
                        {
                            ID = reader.GetInt32(0),
                            Name = reader.GetString(16),
                            Surname = reader.GetString(17),
                            Number = reader.GetInt32(18),
                            Club = new Club()
                            {
                                ID = reader.GetInt32(19),
                                Season = new Season()
                                {
                                    ID = reader.GetInt32(20)
                                }
                            }
                        }
                    };
                    playerStatistics.Add(statistics);
                }

            }
            catch (Exception e)
            {
                throw new Exception("Greska pri upisu", e);
            }
            finally
            {
                MySqlConn.CloseReader(reader);
                MySqlConn.CloseConn(conn);
            }

            return playerStatistics;
        }

        public List<PlayerStatistics> GetPlayerStatistics(int playerId, int seasonId)
        {
            List<PlayerStatistics> playerStatistics = new List<PlayerStatistics>();
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = Select;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@igrac", playerId);
                cmd.Parameters.AddWithValue("@sezona", seasonId);

                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    PlayerStatistics statistics = new PlayerStatistics()
                    {
                        PTS = reader.GetInt32(2),
                        MIN = reader.GetString(3),
                        FGM = reader.GetInt32(4),
                        FGA = reader.GetInt32(5),
                        _3FGM = reader.GetInt32(6),
                        _3FGA = reader.GetInt32(7),
                        FTM = reader.GetInt32(8),
                        FTA = reader.GetInt32(9),
                        AS = reader.GetInt32(10),
                        OReb = reader.GetInt32(11),
                        DReb = reader.GetInt32(12),
                        BLK = reader.GetInt32(13),
                        STL = reader.GetInt32(14),
                        Fouls = reader.GetInt32(15)
                    };
                    statistics.Game = new MySqlGame().GetGameById(reader.GetInt32(1));
                    playerStatistics.Add(statistics);
                }

            }
            catch (Exception e)
            {
                throw new Exception("Greska pri upisu", e);
            }
            finally
            {
                MySqlConn.CloseReader(reader);
                MySqlConn.CloseConn(conn);
            }

            return playerStatistics;
        }

        public string AddPlayerOnGame(PlayerStatistics playerStatistics)
        {
            string msg = "";
            MySqlConnection conn = null;
            MySqlCommand cmd;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = Insert;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@osoba", playerStatistics.Player.ID);
                cmd.Parameters.AddWithValue("@utakmica", playerStatistics.Game.ID);
                cmd.Parameters.AddWithValue("@pts", playerStatistics.PTS);
                cmd.Parameters.AddWithValue("@min", playerStatistics.MIN);
                cmd.Parameters.AddWithValue("@fgm", playerStatistics.FGM);
                cmd.Parameters.AddWithValue("@fga", playerStatistics.FGA);
                cmd.Parameters.AddWithValue("@_3fgm", playerStatistics._3FGM);
                cmd.Parameters.AddWithValue("@_3fga", playerStatistics._3FGA);
                cmd.Parameters.AddWithValue("@ftm", playerStatistics.FTM);
                cmd.Parameters.AddWithValue("@fta", playerStatistics.FTA);
                cmd.Parameters.AddWithValue("@as", playerStatistics.AS);
                cmd.Parameters.AddWithValue("@oreb", playerStatistics.OReb);
                cmd.Parameters.AddWithValue("@dreb", playerStatistics.DReb);
                cmd.Parameters.AddWithValue("@blk", playerStatistics.BLK);
                cmd.Parameters.AddWithValue("@stl", playerStatistics.STL);
                cmd.Parameters.AddWithValue("@fouls", playerStatistics.Fouls);
                cmd.Parameters.Add("@msg", MySqlDbType.VarChar);
                cmd.Parameters["@msg"].Direction = System.Data.ParameterDirection.Output;

                cmd.ExecuteNonQuery();
                msg = cmd.Parameters["@msg"].Value.ToString();
            }
            catch(Exception e)
            {
                throw new Exception("Greska pri upisu", e);
            }
            finally
            {
                MySqlConn.CloseConn(conn);
            }
            return msg;
        }

        public void DeletePlayerOnGame(int playerId, int gameId)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = Delete;

                cmd.Parameters.AddWithValue("@idOsobe", playerId);
                cmd.Parameters.AddWithValue("@idUtakmice", gameId);

                int i = cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Brisanju", e);
            }
            finally
            {
                MySqlConn.CloseConn(conn);
            }
        }
    }
}