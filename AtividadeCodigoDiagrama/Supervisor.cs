using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AtividadeCodigoDiagrama
{
    internal class Supervisor:Usuario
    {
        public Setor setor;

        public void Supervisionar()
        {
            Console.WriteLine("O funcionario " + nome + "está supervisando o setor " + setor.nome);
        }
    }
}
