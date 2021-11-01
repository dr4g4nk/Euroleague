using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace Euroleague.Data.Model
{ 
    public class Person
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public System.DateTime Born { get; set; }
        public State State { get; set; }
        public string PicturePath { get; set; }

        public override bool Equals(object obj)
        {
            return obj is Person person &&
                   ID == person.ID &&
                   Name == person.Name &&
                   Surname == person.Surname &&
                   Born == person.Born;
        }

        public override int GetHashCode()
        {
            int hashCode = 848775802;
            hashCode = hashCode * -1521134295 + ID.GetHashCode();
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Name);
            hashCode = hashCode * -1521134295 + EqualityComparer<string>.Default.GetHashCode(Surname);
            hashCode = hashCode * -1521134295 + Born.GetHashCode();
            return hashCode;
        }

        public override string ToString()
        {
            return Name + " " + Surname;
        }


    }
}