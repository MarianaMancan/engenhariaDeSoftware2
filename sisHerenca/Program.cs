using sisHerenca;

Cliente clienteTeste = new Cliente();
clienteTeste.nome = "Luan";
clienteTeste.rg = "123";
clienteTeste.cpf = "456";
clienteTeste.nascimento = "20/12/1993";

clienteTeste.exibeDados();

Usuario usuarioTeste = new Usuario();
usuarioTeste.nome = "carlos";
usuarioTeste.rg = "4323";
usuarioTeste.cpf = "945843";
usuarioTeste.nascimento = "21/09/1990";
usuarioTeste.login = "carlos23";
usuarioTeste.senha = "123";
usuarioTeste.exibeDados();
usuarioTeste.logar();


Admin adminTeste = new Admin();
adminTeste.nome = "Julia";
adminTeste.rg = "098";
adminTeste.cpf = "8437";
adminTeste.nascimento = "09/02/1980";
adminTeste.login = "username";
adminTeste.senha = "password";
adminTeste.salario = 12.000f;
adminTeste.exibeDados();
adminTeste.logar();
adminTeste.gerenciar();
