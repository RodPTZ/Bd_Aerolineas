namespace Aero.Core;

public class Tripulaciones
{
    public required int id_tripulaciones { get; set; }
    public required int id_empleado { get; set; }
    public required string matricula { get; set; }
    public required string rol_en_vuelo { get; set; }
}