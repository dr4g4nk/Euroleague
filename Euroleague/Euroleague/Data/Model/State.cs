namespace Euroleague.Data.Model
{
    public class State
    { 
        public int ID { get; set; }
        public string Name { get; set; }
        public State(int id, string name)
        {
            ID = id;
            Name = name;
        }

        public State()
        {
        }

        public override string ToString()
        {
            return Name;
        }
    }
}