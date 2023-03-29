using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AtividadeCodigoDiagrama
{
    internal class Setor
    {

        public String nome;
        public List<Funcionario> funcionarios;

        public void inserirFuncionario(Funcionario funcionario)
        {
            funcionarios.Add(funcionario);
        }
    }
}
