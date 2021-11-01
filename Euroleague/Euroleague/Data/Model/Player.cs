using System;
using System.Collections.Generic;

namespace Euroleague.Data.Model
{
    public class Player : Person
    {
        public string Position { get; set; }
        public decimal Height { get; set; }
        public int? Number { get; set; }
        public string Bio { get; set; }
        public Club Club { get; set; }
    }
}