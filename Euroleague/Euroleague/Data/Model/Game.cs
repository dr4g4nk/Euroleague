using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Euroleague.Data.Model
{
    public class Game
    {
        public int ID { get; set; }
        public System.DateTime Time { get; set; }
        public int? FirstQuarterH { get; set; }
        public int? FirstQuarterG { get; set; }
        public int? SecondQuarterH { get; set; }
        public int? SecondQuarterG { get; set; }
        public int? ThirdQuarterH { get; set; }
        public int? ThirdQuarterG { get; set; }
        public int? FourthQuarterH { get; set; }
        public int? FourthQuarterG { get; set; }
        public int? OverTimeH { get; set; }
        public int? OverTimeG { get; set; }
        public Club HomeClub { get; set; }
        public Club GuestClub { get; set; }
        public Round Round { get; set; }
        public List<Person> Referees { get; set; }

        public override bool Equals(object obj)
        {
            return base.Equals(obj);
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        public override string ToString()
        {
            return HomeClub.ToString() + " vs " + GuestClub.ToString();
        }

        public static int Compare(Game g1, Game g2)
        {
            if (g1.Round.Phase.CompetitionPhase.Equals(g2.Round.Phase.CompetitionPhase))
            {
                if (g1.Round.Num > g2.Round.Num)
                    return 1;
                else if (g1.Round.Num > g2.Round.Num)
                    return -1;
                return 0;
            }
            return 1;
        }
    }
}
