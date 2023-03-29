using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AtividadeCodigoDiagrama
{
    internal class Funcionario: Usuario
    {
        private float salario;

        public void Trabalhar()
        {
            Console.WriteLine("O usuario " + username + "está trabalhando");
        }

    }
}
