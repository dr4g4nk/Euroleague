using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Euroleague.Data.Model;
using MySql.Data.MySqlClient;

namespace Euroleague.Data.DataAccess
{
    class MySqlPlayer
    {
        private static readonly string SelectAll = @"select * from osoba natural join igrac;";
        private static readonly string SelectByIdClubAndSeason = @"select * from player where IdOsobe=@IdOsobe and IdKluba=@IdKluba and IdSezone=@IdSezone";
        private static readonly string SelectByClubAndSeason = @"select * from player where IdKluba=@IdKluba and IdSezone=@IdSezone";
        private static readonly string Insert = @"insertPlayer";
        private static readonly string Update = @"updatePlayer";
        private static readonly string Delete = @"deletePlayer";
        private static readonly string InsertPlayerClub = @"insert into igrau values (@idSezone, @idKluba, @idOsobe, @dres)";

        internal List<Player> GetAllPlayers()
        {
            List<Player> players = new List<Player>();
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
                    Player player = new Player()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        Surname = reader.GetString(2),
                        PicturePath = reader.GetString(4)
                    };
                    players.Add(player);
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
            return players;
        }

        public List<Player> GetPlayers(Club club, Season season)
        {
            List<Player> players = new List<Player>();
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();

                cmd.CommandText = SelectByClubAndSeason;

                cmd.Parameters.AddWithValue("@IdKluba", club.ID);
                cmd.Parameters.AddWithValue("@IdSezone", season.ID);

                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Player player = new Player()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        Surname = reader.GetString(2),
                        Born = reader.GetDateTime(3),
                        PicturePath = reader.GetString(4),
                        
                        State = new State()
                        {
                            ID = reader.GetInt32(5),
                            Name = reader.GetString(6)
                        },
                        Height = reader.GetDecimal(7),
                        Position = reader.GetString(8),
                        Bio = reader.GetString(9),
                        Number = reader.GetInt32(10),
                        Club = club
                    };
                    players.Add(player);
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
            return players;
        }
        public Player GetPlayerByIdClubAndSeason(int playerId, int clubId, int seasonId)
        {
            Player player = null;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();

                cmd.CommandText = SelectByIdClubAndSeason;

                cmd.Parameters.AddWithValue("@idOsobe", playerId);
                cmd.Parameters.AddWithValue("@IdKluba", clubId);
                cmd.Parameters.AddWithValue("@IdSezone", seasonId);

                reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    player = new Player()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        Surname = reader.GetString(2),
                        Born = reader.GetDateTime(3),
                        PicturePath = reader.GetString(4),

                        State = new State()
                        {
                            ID = reader.GetInt32(5),
                            Name = reader.GetString(6)
                        },
                        Height = reader.GetDecimal(7),
                        Position = reader.GetString(8),
                        Bio = reader.GetString(9),
                        Number = reader.GetInt32(10)
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
            return player;
        }

        internal string DeletePlayer(Player player)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd;
            string msg = "";

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = Delete;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@id", player.ID);
                cmd.Parameters.AddWithValue("@klub", player.Club.ID);
                cmd.Parameters.AddWithValue("@sezona", player.Club.Season.ID);

                int i = cmd.ExecuteNonQuery();
            }
            catch
            {
                msg = "Igrac ne moze biti obrisan jer je igrao na nekoj utakmici";
            }
            finally
            {
                MySqlConn.CloseConn(conn);
            }
            return msg;
        }

        internal int AddPlayer(Player player)
        {
            int id = 0;
            MySqlConnection conn = null;
            MySqlCommand cmd;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = Insert;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ime", player.Name);
                cmd.Parameters.AddWithValue("@prezime", player.Surname);
                cmd.Parameters.AddWithValue("@datumRodjenja", player.Born);
                cmd.Parameters.AddWithValue("@visina", player.Height);
                cmd.Parameters.AddWithValue("@pozicija", player.Position);
                cmd.Parameters.AddWithValue("@slika", player.PicturePath);
                cmd.Parameters.AddWithValue("@drzava", player.State.ID);
                cmd.Parameters.AddWithValue("@biografija", player.Bio);
                cmd.Parameters.Add("@lastId", MySqlDbType.Int32);
                cmd.Parameters["@lastId"].Direction = System.Data.ParameterDirection.Output;

                int i = cmd.ExecuteNonQuery();

                id = Convert.ToInt32(cmd.Parameters["@lastId"].Value);
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

        internal void AddPlayerClub(Player player)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = InsertPlayerClub;
                
                cmd.Parameters.AddWithValue("@idSezone", player.Club.Season.ID);
                cmd.Parameters.AddWithValue("@idKluba", player.Club.ID);
                cmd.Parameters.AddWithValue("@idOsobe", player.ID);
                cmd.Parameters.AddWithValue("@dres", player.Number);

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

        internal void UpdatePlayer(Player player)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = Update;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@id", player.ID);
                cmd.Parameters.AddWithValue("@ime", player.Name);
                cmd.Parameters.AddWithValue("@prezime", player.Surname);
                cmd.Parameters.AddWithValue("@datumRodjenja", player.Born);
                cmd.Parameters.AddWithValue("@visina", player.Height);
                cmd.Parameters.AddWithValue("@pozicija", player.Position);
                cmd.Parameters.AddWithValue("@slika", player.PicturePath);
                cmd.Parameters.AddWithValue("@drzava", player.State.ID);
                cmd.Parameters.AddWithValue("@biografija", player.Bio);

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
    }
}