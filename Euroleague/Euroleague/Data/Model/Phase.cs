using System.Collections.Generic;

namespace Euroleague.Data.Model
{
    public class Phase
    {
        public string CompetitionPhase { get; set; }
        public Season Season { get; set; }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        public override string ToString()
        {
            return CompetitionPhase;
        }

        public static int Compare(Phase p1, Phase p2)
        {
            return string.Compare(p1.CompetitionPhase, p2.CompetitionPhase);
        }

        public override bool Equals(object obj)
        {
            return obj is Phase phase &&
                   CompetitionPhase == phase.CompetitionPhase &&
                   EqualityComparer<Season>.Default.Equals(Season, phase.Season);
        }
    }
}