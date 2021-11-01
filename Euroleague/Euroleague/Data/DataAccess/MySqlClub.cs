using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Euroleague.Data.Model;
using MySql.Data.MySqlClient;

namespace Euroleague.Data.DataAccess
{
    public class MySqlClub
    {
        private static readonly string Insert = @"insertClub";
        private static readonly string SelectClubsBySeasonId = @"select * from club where IdSezone=@IdSezone";
        private static readonly string Update = @"updateClub";
        private static readonly string Delete = @"delete from igrau where IdKluba=@IdKluba and IdSezone=@IdSezone; delete from klubsezona where IdKluba=@IdKluba and IdSezone=@IdSezone";
        private static readonly string SelectClubById = @"select * from clubaddress where IdKluba=@IdKluba";
        private static readonly string SelectAll = @"select * from clubaddress";
        private static readonly string InsertClubSeason = @"insert into klubsezona values (@idSezone, @idKluba,0,0,0,0)";


        public List<Club> GetClubsBySeason(int seasonId)
        {
            List<Club> clubs = new List<Club>();
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();

                cmd.CommandText = SelectClubsBySeasonId;
                cmd.Parameters.AddWithValue("@IdSezone", seasonId);

                reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    clubs.Add(new Club()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        Info = reader.GetString(2),
                        Picture = reader.GetString(3),
                        Phone = reader.GetString(4),
                        OfficialWebsite = reader.GetString(5),
                        Twitter = reader.GetString(6),
                        Instagram = reader.GetString(7),
                        Facebook = reader.GetString(8),
                        YouTube = reader.GetString(9),
                        Address = new Address()
                        {
                            ID = reader.GetInt32(10),
                            Street = reader.GetString(11),
                            Num = reader.GetInt32(12),
                            City = new City()
                            {
                                ID = reader.GetInt32(13),
                                Name = reader.GetString(14),
                                State = new State()
                                {
                                    ID = reader.GetInt32(15),
                                    Name = reader.GetString(16)
                                }
                            }
                        },
                        President = new Person()
                        {
                            ID = reader.GetInt32(17),
                            Name = reader.GetString(18),
                            Surname = reader.GetString(19)
                        },
                        Season = new Season()
                        {
                            ID = seasonId
                        },
                        W = reader.GetInt32(21),
                        L = reader.GetInt32(22),
                        PTSplus = reader.GetInt32(23),
                        PTSminus = reader.GetInt32(24)
                    });
                }
            }
            catch (Exception e)
            {
                throw new Exception("Greska pri citanju", e);
            }
            finally
            {
                MySqlConn.CloseConn(conn);
            }

            return clubs;
        }

        internal Club GetClubById(int clubId)
        {
            Club club = null;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = SelectClubById;
                cmd.Parameters.AddWithValue("@IdKluba", clubId);
                reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    club = new Club()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        President = new Person()
                        {
                            ID = reader.GetInt32(2),
                            Name = reader.GetString(3),
                            Surname = reader.GetString(4)
                        },
                        Info = reader.GetString(5),
                        Picture = reader.GetString(6),
                        Phone = reader.GetString(7),
                        OfficialWebsite = reader.GetString(8),
                        Twitter = reader.GetString(9),
                        Instagram = reader.GetString(10),
                        Facebook = reader.GetString(11),
                        YouTube = reader.GetString(12),
                        Address = new Address()
                        {
                            ID = reader.GetInt32(13),
                            Street = reader.GetString(14),
                            Num = reader.GetInt32(15),
                            City = new City()
                            {
                                ID = reader.GetInt32(16),
                                Name = reader.GetString(17),
                                State = new State()
                                {
                                    ID = reader.GetInt32(18),
                                    Name = reader.GetString(19)
                                }
                            }
                        },
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

            return club;
        }

        internal List<Club> GetClubs()
        {
            List<Club> clubs = new List<Club>();
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
                    clubs.Add(new Club()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(1),
                        President = new Person()
                        {
                            ID = reader.GetInt32(2),
                            Name = reader.GetString(3),
                            Surname = reader.GetString(4)
                        },
                        Info = reader.GetString(5),
                        Picture = reader.GetString(6),
                        Phone = reader.GetString(7),
                        OfficialWebsite = reader.GetString(8),
                        Twitter = reader.GetString(9),
                        Instagram = reader.GetString(10),
                        Facebook = reader.GetString(11),
                        YouTube = reader.GetString(12),
                        Address = new Address()
                        {
                            ID = reader.GetInt32(13),
                            Street = reader.GetString(14),
                            Num = reader.GetInt32(15),
                            City = new City()
                            {
                                ID = reader.GetInt32(16),
                                Name = reader.GetString(17),
                                State = new State()
                                {
                                    ID = reader.GetInt32(18),
                                    Name = reader.GetString(19)
                                }
                            }
                        },
                    });
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

            return clubs;
        }

        internal void DeleteClub(int club, int season)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = Delete;

                cmd.Parameters.AddWithValue("@IdKluba", club);
                cmd.Parameters.AddWithValue("@IdSezone", season);

                int i = cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Greska pri brisanju", e);
            }
            finally
            {
                MySqlConn.CloseConn(conn);
            }
        }

        internal string UpdateClub(Club club)
        {
            string result = "";
            MySqlConnection conn = null;
            MySqlCommand cmd;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = Update;
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@pId", club.ID);
                cmd.Parameters.AddWithValue("@pNaziv", club.Name);
                cmd.Parameters.AddWithValue("@pPredsjednik", club.President.ID);
                cmd.Parameters.AddWithValue("@pInfo", club.Info);
                cmd.Parameters.AddWithValue("@pAdresa", club.Address.ID);
                cmd.Parameters.AddWithValue("@pGrb", club.Picture);
                cmd.Parameters.AddWithValue("@pTelefon", club.Phone);
                cmd.Parameters.AddWithValue("@pStranica", club.OfficialWebsite);
                cmd.Parameters.AddWithValue("@pTwitter", club.Twitter);
                cmd.Parameters.AddWithValue("@pInstagram", club.Instagram);
                cmd.Parameters.AddWithValue("@pFacebook", club.Facebook);
                cmd.Parameters.AddWithValue("@pYouTube", club.YouTube);
                cmd.Parameters.Add("@result", MySqlDbType.VarChar);
                cmd.Parameters["@result"].Direction = System.Data.ParameterDirection.Output;

                int i = cmd.ExecuteNonQuery();
                result = cmd.Parameters["@result"].Value.ToString();
            }
            catch (Exception e)
            {
                throw new Exception("Greska pri citanju", e);
            }
            finally
            {
                MySqlConn.CloseConn(conn);
            }
            return result;
        }

        public int AddClub(Club club)
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

                cmd.Parameters.AddWithValue("@naziv", club.Name);
                cmd.Parameters.AddWithValue("@predsjednik", club.President.ID);
                cmd.Parameters.AddWithValue("@info", club.Info);
                cmd.Parameters.AddWithValue("@adresa", club.Address.ID);
                cmd.Parameters.AddWithValue("@grb", club.Picture);
                cmd.Parameters.AddWithValue("@telefon", club.Phone);
                cmd.Parameters.AddWithValue("@stranica", club.OfficialWebsite);
                cmd.Parameters.AddWithValue("@twitter", club.Twitter);
                cmd.Parameters.AddWithValue("@instagram", club.Instagram);
                cmd.Parameters.AddWithValue("@facebook", club.Facebook);
                cmd.Parameters.AddWithValue("@youtube", club.YouTube);
                cmd.Parameters.Add("@result", MySqlDbType.VarChar);
                cmd.Parameters["@result"].Direction = System.Data.ParameterDirection.Output;
                cmd.Parameters.Add("@lastId", MySqlDbType.Int32);
                cmd.Parameters["@lastId"].Direction = System.Data.ParameterDirection.Output;

                int i = cmd.ExecuteNonQuery();
                string result = cmd.Parameters["@result"].Value.ToString();

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


        public void InsertClubInSeason(int club, int season)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = InsertClubSeason;
                cmd.Parameters.AddWithValue("@idSezone", season);
                cmd.Parameters.AddWithValue("@idKluba", club);
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                throw new Exception("Greska, klub vec postoji", e);
            }
            finally
            {
                MySqlConn.CloseConn(conn);
            }
        }
    }
}