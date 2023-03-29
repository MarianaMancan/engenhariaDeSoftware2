using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AtividadeCodigoDiagrama
{
    internal class Usuario
    {

        public String username;
        public String senha;
        public String nome;


        public void logar()
        {
            Console.WriteLine("O usuario " + username + "está logado");
        }
    }
}
