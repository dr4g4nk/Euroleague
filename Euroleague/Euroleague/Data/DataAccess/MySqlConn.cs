using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace Euroleague.Data.DataAccess
{
    class MySqlConn
    {
        private static readonly string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Euroleague"].ConnectionString;

        public static MySqlConnection GetConnection()
        {
            var conn = new MySqlConnection(connectionString);
            conn.Open();
            return conn;
        }

        public static void CloseReader(MySqlDataReader reader)
        {
            if(reader != null)
            {
                try
                {
                    reader.Close();
                }
                catch { }
            }
        }

        public static void CloseConn(MySqlConnection conn)
        {
            if (conn != null)
            {
                try
                {
                    conn.Close();
                }
                catch { }
            }
        }
    }
}
