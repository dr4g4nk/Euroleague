using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Euroleague.Data.Model
{
    public class Club
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public Person President { get; set; }
        public Coach Coach { get; set; }
        public Address Address { get; set; }
        public Arena Arena { get; set; }
        public Arena BackupArena { get; set; }
        public string Picture { get; set; }
        public string Info { get; set; }
        public int W { get; set; }
        public int L { get; set; }
        public int PTSplus { get; set; }
        public int PTSminus { get; set; }
        public string Phone { get; set; }
        public string OfficialWebsite { get; set; }
        public string Twitter { get; set; }
        public string Instagram { get; set; }
        public string Facebook { get; set; }
        public string YouTube { get; set; }
        public Season Season { get; set; }

        public override string ToString()
        {
            return Name;
        }

        public override bool Equals(object obj)
        {
            return obj is Club club &&
                   ID == club.ID;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }
        public static int Compare(Club c1, Club c2)
        {
            if (c1.W > c2.W)
                return -1;
            else if (c1.W < c2.W)
                return 1;
            else
            {
                int pts1 = c1.PTSplus - c1.PTSminus;
                int pts2 = c2.PTSplus - c2.PTSminus;
                if (pts1 > pts2)
                    return -1;
                else if (pts1 < pts2)
                    return 1;
                return 0;
            }
        }
    }
}