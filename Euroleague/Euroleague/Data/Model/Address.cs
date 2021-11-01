using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Euroleague.Data.Model
{
    public class Address
    {
        public int ID { get; set; }
        public string Street { get; set; }
        public int Num { get; set; }
        public City City { get; set; }

        public override string ToString()
        {
            return Street + " " + Num + " " + City.ToString() + ", " + City.State.ToString();
        }
    }
}
