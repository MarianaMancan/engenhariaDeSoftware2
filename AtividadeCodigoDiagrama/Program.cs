
using AtividadeCodigoDiagrama;

Console.WriteLine("Hello, World!");
Supervisor supervisor = new Supervisor();
Setor setor = new Setor();
setor.nome = "produção";
supervisor.nome = "Andre";
supervisor.setor = setor;
supervisor.Supervisionar();
