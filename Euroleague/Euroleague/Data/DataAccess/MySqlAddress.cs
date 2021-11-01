using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Euroleague.Data.Model;
using MySql.Data.MySqlClient;

namespace Euroleague.Data.DataAccess
{
    public class MySqlAddress
    {
        private static readonly string SelectAll = @"select * from address";
        private static readonly string SelectOne = @"SELECT IdAdrese FROM adresa where Ulica=@Ulica and Broj=@Broj and IdGrada=@IdGrada";
        private static readonly string Insert = @"insert into adresa (Ulica, Broj, IdGrada) values (@Ulica, @Broj, @IdGrada)";

        public List<Address> GetAddresses()
        {
            List<Address> addresses = new List<Address>();
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
                    addresses.Add(new Address()
                    {
                        ID = reader.GetInt32(0),
                        Street = reader.GetString(1),
                        Num = reader.GetInt32(2),
                        City = new City()
                        {
                            ID = reader.GetInt32(3),
                            Name = reader.GetString(4),
                            State = new State()
                            {
                                ID = reader.GetInt32(5),
                                Name = reader.GetString(6),
                            }
                        }
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

            return addresses;
        }

        public int? GetAddressID(Address address)
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
                cmd.Parameters.AddWithValue("@Ulica", address.Street);
                cmd.Parameters.AddWithValue("@Broj", address.Num);
                cmd.Parameters.AddWithValue("@IdGrada", address.City.ID);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    id = reader.GetInt32(0);
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
            return id;
        }
        public void AddAddress(Address address)
        {
            if (GetAddressID(address) == null)
            {
                MySqlConnection conn = null;
                MySqlCommand cmd;

                try
                {
                    conn = MySqlConn.GetConnection();
                    cmd = conn.CreateCommand();
                    cmd.CommandText = Insert;
                    cmd.Parameters.AddWithValue("@Ulica", address.Street);
                    cmd.Parameters.AddWithValue("@Broj", address.Num);
                    cmd.Parameters.AddWithValue("@IdGrada", address.City.ID);
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
