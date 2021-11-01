using System;

namespace Euroleague.Data.Model
{
    public class Season
    {
        public int ID { get; set; }
        public System.DateTime Start { get; set; }
        public System.DateTime End { get; set; }
        public string Name { get; set; }

        public override bool Equals(object obj)
        {
            return obj is Season season &&
                   ID == season.ID;
        }

        public override string ToString()
        {
            return Name;
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        public static int Compare(Season s1, Season s2)
        {
            if (s1.End > s2.End)
                return 1;
            else if (s1.End < s2.End)
                return -1;
            return 0;
        }
    }
}