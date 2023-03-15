using System;


    public class Lentes
    {
    public float grau;
    public String tipoFoco;
    public String formato;
    public bool antiReflexo;

    public void exibeDados()
    {
        Console.WriteLine("Grau: " + grau + " Tipo Foco: " + tipoFoco + " Formato: " + formato);
    }

    }

