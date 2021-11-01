using System.Collections.Generic;

namespace Euroleague.Data.Model
{
    public class Round
    {
        public int ID { get; set; }
        public int Num { get; set; }
        public Phase Phase { get; set; }

        public override bool Equals(object obj)
        {
            return obj is Round round &&
                   ID == round.ID &&
                   Num == round.Num &&
                   EqualityComparer<Phase>.Default.Equals(Phase, round.Phase);
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        public override string ToString()
        {
            return Num.ToString();
        }
    }
}