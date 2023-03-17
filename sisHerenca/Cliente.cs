using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sisHerenca
{
    internal class Cliente
    {
        public string nome;
        public string rg;
        public string cpf;
        public string nascimento;


        public void exibeDados()
        {
            Console.WriteLine("Nome: " + nome + " CPF: " + cpf);
        }
    }
}
