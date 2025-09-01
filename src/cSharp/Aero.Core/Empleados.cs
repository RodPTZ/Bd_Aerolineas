namespace Aero.Core;

public class Empleados
{
    public required int id_Empleado { get; set; }
    public required string nombre { get; set; }
    public required string apellido { get; set; }
    public required string DNI { get; set; }
    public required string cargo { get; set; }
    public required date fecha_ingreso { get; set; }
    public required string CUIL { get; set; }
    public required  float salario { get; set; }
}
