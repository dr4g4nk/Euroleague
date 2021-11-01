using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Euroleague.Data.Model
{
    public class PlayerStatistics
    {
        public Player Player { get; set; }
        public Game Game { get; set; }
        public int PTS { get; set; }
        public string MIN { get; set; }
        public int FGM { get; set; }
        public int FGA { get; set; }
        public int _3FGM { get; set; }
        public int _3FGA { get; set; }
        public int FTM { get; set; }
        public int FTA { get; set; }
        public int AS { get; set; }
        public int OReb { get; set; }
        public int DReb { get; set; }
        public int BLK { get; set; }
        public int STL { get; set; }
        public int Fouls { get; set; }
    }
}
