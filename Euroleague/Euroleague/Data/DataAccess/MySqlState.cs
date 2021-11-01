using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Euroleague.Data.Model;
using MySql.Data.MySqlClient;

namespace Euroleague.Data.DataAccess
{
    public class MySqlState
    {
        private static readonly string SelectAll = @"SELECT * FROM drzava";
        private static readonly string SelectOne = @"SELECT * FROM drzava WHERE IdDrzave=@id";
        private static readonly string Insert = @"INSERT INTO drzava (Naziv) VALUES (@Naziv)";

        public List<State> GetStates()
        {
            List<State> states = new List<State>();
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = Euroleague.Data.DataAccess.MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = SelectAll;
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    states.Add(new State()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(1)
                    }) ;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Exception in MySqlState", ex);
            }
            finally
            {
                MySqlConn.CloseReader(reader);
                MySqlConn.CloseConn(conn);
            }

            return states;
        }

        public State GetStateById(int id)
        {
            State state = null;
            MySqlConnection conn = null;
            MySqlCommand cmd;
            MySqlDataReader reader = null;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = SelectOne;
                cmd.Parameters.AddWithValue("@id", id);
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    state = new State()
                    {
                        ID = reader.GetInt32(0),
                        Name = reader.GetString(1)
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Exception in MySqlState", ex);
            }
            finally
            {
                MySqlConn.CloseReader(reader);
                MySqlConn.CloseConn(conn);
            }
            return state;
        }

        public void AddState(State state)
        {
            MySqlConnection conn = null;
            MySqlCommand cmd;

            try
            {
                conn = MySqlConn.GetConnection();
                cmd = conn.CreateCommand();
                cmd.CommandText = Insert;
                cmd.Parameters.AddWithValue("@Naziv", state.Name);

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Exception in MySqlState", ex);
            }
            finally
            {
                MySqlConn.CloseConn(conn);
            }

        }

    }
}
