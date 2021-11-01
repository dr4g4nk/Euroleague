namespace Euroleague.Data.Model
{
    public class City
    {
        public City()
        {
        }

        public City(int iD, string name, State state)
        {
            ID = iD;
            Name = name;
            State = state;
        }

        public int ID { get; set; }
        public string Name { get; set; }
        public State State { get; set; }

        public override string ToString()
        {
            return Name;
        }
    }
}