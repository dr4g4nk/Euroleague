namespace Euroleague.Data.Model
{
    public class Arena
    {
        public Arena()
        {
        }

        public Arena(int iD, string name, int capacity, Address address)
        {
            ID = iD;
            Name = name;
            Capacity = capacity;
            Address = address;
        }

        public int ID { get; set; }
        public string Name { get; set; }
        public int Capacity { get; set; }
        public Address Address { get; set; }
    }
}