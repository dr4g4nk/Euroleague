using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Euroleague.Data.Model;
using Euroleague.Data.DataAccess;
using MySql.Data.MySqlClient;

namespace Euroleague.Data.DataAccess
{
    class MySqlGame
    {
        private static readonly string InsertGame = @"insertGame";
        private static readonly string SelectById = @"select * from utakmica where IdUtakmice=@IdUtakmice";
        private static readonly string SelectByClubAndRoundId = @"select * from utakmica where IdKola=@IdKola and (IdDomacina=@clubId or IdGosta=@clubId)";
        private static readonly string SelectByPhase = @"select * from utakmica where IdSezone=@sezona and Faza=@faza";
        private static readonly string DeleteGame = @"delete from utakmica where IdUtakmice=@id";

        public Game GetGameByClubAndRoundId(int clubId, int roundId)
        {
            Game game = null;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();

                cmd.CommandText = SelectByClubAndRoundId;
                cmd.Parameters.AddWithValue("@IdKola", roundId);
                cmd.Parameters.AddWithValue("@clubId", clubId);

                reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    game = new Game()
                    {
                        ID = reader.GetInt32(0),
                        HomeClub = new Club()
                        {
                            ID = reader.GetInt32(12)
                        },
                        GuestClub = new Club()
                        {
                            ID = reader.GetInt32(13)
                        }
                    };
                }

            }
            catch (Exception e)
            {
                throw new Exception("Greska pri citanju", e);
            }
            finally
            {
                MySqlConn.CloseReader(reader);
                MySqlConn.CloseConn(conn);
            }
            if (game != null)
            {
                MySqlClub mySqlClub = new MySqlClub();
                game.HomeClub = mySqlClub.GetClubById(game.HomeClub.ID);
                game.GuestClub = mySqlClub.GetClubById(game.GuestClub.ID);
            }
            return game;
        }

        public Game GetGameById(int gameId)
        {
            Game game = null;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();

                cmd.CommandText = SelectById;
                cmd.Parameters.AddWithValue("@IdUtakmice", gameId);

                reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    game = new Game()
                    {
                        ID = reader.GetInt32(0),
                        Time = reader.GetDateTime(1),
                        FirstQuarterH = reader.GetInt32(2),
                        FirstQuarterG = reader.GetInt32(3),
                        SecondQuarterH = reader.GetInt32(4),
                        SecondQuarterG = reader.GetInt32(5),
                        ThirdQuarterH = reader.GetInt32(6),
                        ThirdQuarterG = reader.GetInt32(7),
                        FourthQuarterH = reader.GetInt32(8),
                        FourthQuarterG = reader.GetInt32(9),
                        OverTimeH = reader.GetInt32(10),
                        OverTimeG = reader.GetInt32(11),
                        HomeClub = new Club()
                        {
                            ID = reader.GetInt32(12)
                        },
                        GuestClub = new Club()
                        {
                            ID = reader.GetInt32(13)
                        },
                        Round = new Round()
                        {
                            ID = reader.GetInt32(14),
                            Phase = new Phase()
                            {
                                CompetitionPhase = reader.GetString(15),
                                Season = new Season()
                                {
                                    ID = reader.GetInt32(16)
                                }
                            }
                        }
                    };
                }
            }
            catch (Exception e)
            {
                throw new Exception("Greska pri citanju", e);
            }
            finally
            {
                MySqlConn.CloseReader(reader);
                MySqlConn.CloseConn(conn);
            }

            if(game != null)
            {
                MySqlClub mySqlClub = new MySqlClub();
                game.HomeClub = mySqlClub.GetClubById(game.HomeClub.ID);
                game.GuestClub = mySqlClub.GetClubById(game.GuestClub.ID);
                MySqlRound mySqlRound = new MySqlRound();
                game.Round = mySqlRound.GetRoundById(game.Round.ID);
            }
            return game;
        }

        internal void Delete(Game game)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = DeleteGame;

                cmd.Parameters.AddWithValue("@id", game.ID);

                int i = cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Greska pri citanju", e);
            }
            finally
            {
                MySqlConn.CloseConn(conn);
            }
        }
        public List<Game> GetGamesByPhase(Phase phase)
        {
            List<Game> games = new List<Game>();
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();

                cmd.CommandText = SelectByPhase;
                cmd.Parameters.AddWithValue("@sezona", phase.Season.ID);
                cmd.Parameters.AddWithValue("@faza", phase.CompetitionPhase);

                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Game game = new Game()
                    {
                        ID = reader.GetInt32(0),
                        Time = reader.GetDateTime(1),
                        FirstQuarterH = reader.GetInt32(2),
                        FirstQuarterG = reader.GetInt32(3),
                        SecondQuarterH = reader.GetInt32(4),
                        SecondQuarterG = reader.GetInt32(5),
                        ThirdQuarterH = reader.GetInt32(6),
                        ThirdQuarterG = reader.GetInt32(7),
                        FourthQuarterH = reader.GetInt32(8),
                        FourthQuarterG = reader.GetInt32(9),
                        OverTimeH = reader.GetInt32(10),
                        OverTimeG = reader.GetInt32(11),
                        Round = new Round()
                        {
                            ID = reader.GetInt32(14),
                            Phase = phase,
                            Num = reader.GetInt32(16)
                        },
                        HomeClub = new Club()
                        {
                            ID = reader.GetInt32(12)
                        },
                        GuestClub = new Club()
                        {
                            ID = reader.GetInt32(13)
                        }
                    };

                    games.Add(game);
                }

            }
            catch (Exception e)
            {
                throw new Exception("Greska pri citanju", e);
            }
            finally
            {
                MySqlConn.CloseReader(reader);
                MySqlConn.CloseConn(conn);
            }

            return games;
        }

        public int AddGame(Game game, out string msg)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd;
            int id = 0;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = InsertGame;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@vrijeme", game.Time);
                cmd.Parameters.AddWithValue("@pcd", game.FirstQuarterH);
                cmd.Parameters.AddWithValue("@pcg", game.FirstQuarterG);
                cmd.Parameters.AddWithValue("@dcd", game.SecondQuarterH);
                cmd.Parameters.AddWithValue("@dcg", game.SecondQuarterG);
                cmd.Parameters.AddWithValue("@tcd", game.ThirdQuarterH);
                cmd.Parameters.AddWithValue("@tcg", game.ThirdQuarterG);
                cmd.Parameters.AddWithValue("@ccd", game.FourthQuarterH);
                cmd.Parameters.AddWithValue("@ccg", game.FourthQuarterG);
                cmd.Parameters.AddWithValue("@pd", game.OverTimeH);
                cmd.Parameters.AddWithValue("@pg", game.OverTimeG);
                cmd.Parameters.AddWithValue("@domacin", game.HomeClub.ID);
                cmd.Parameters.AddWithValue("@gost", game.GuestClub.ID);
                cmd.Parameters.AddWithValue("@kolo", game.Round.ID);
                cmd.Parameters.AddWithValue("@faza", game.Round.Phase.CompetitionPhase);
                cmd.Parameters.AddWithValue("@sezona", game.Round.Phase.Season.ID);
                int index = 1;
                game.Referees.ForEach(r => cmd.Parameters.AddWithValue("@idSudije" + (index++), r.ID));
                cmd.Parameters.Add("@msg", MySqlDbType.VarChar);
                cmd.Parameters["@msg"].Direction = System.Data.ParameterDirection.Output;
                cmd.Parameters.Add("@id", MySqlDbType.Int32);
                cmd.Parameters["@id"].Direction = System.Data.ParameterDirection.Output;

                int i = cmd.ExecuteNonQuery();
                id = Convert.ToInt32(cmd.Parameters["@id"].Value);
                msg = cmd.Parameters["@msg"].Value.ToString();
            }
            catch (Exception e)
            {
                throw new Exception("Greska pri citanju", e);
            }
            finally
            {
                MySqlConn.CloseConn(conn);
            }
            return id;
        }
    }
}
