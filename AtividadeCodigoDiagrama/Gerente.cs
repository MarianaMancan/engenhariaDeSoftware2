using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AtividadeCodigoDiagrama
{
    internal class Gerente : Usuario
    {
        public float comissao;

        public void Gerenciar()
        {
            Console.WriteLine("O funcionario " + nome + "está gerenciando");
        }
    }
}
