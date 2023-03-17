using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sisHerenca
{
    internal class Usuario : Cliente
    {

        public string login;
        public string senha;

        public void logar()
        {
            Console.WriteLine("Cliente " + nome + " Entrou no sistema");
        }
    }
}
