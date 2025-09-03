namespace Aero.Core;

public class Empleados
{
    public required int IdEmpleado { get; set; }
    public required string Nombre { get; set; }
    public required string Apellido { get; set; }
    public required string DNI { get; set; }
    public required string Cargo { get; set; }
    public required DateTime Fecha_ingreso { get; set; }
    public required string CUIL { get; set; }
    public required  float Salario { get; set; }
}
