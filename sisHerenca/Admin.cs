using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sisHerenca
{
    internal class Admin : Usuario
    {
        public float salario;


        public void gerenciar()
        {
            Console.WriteLine("O usuario " + nome + " está gerenciando");
        }
    }
}
