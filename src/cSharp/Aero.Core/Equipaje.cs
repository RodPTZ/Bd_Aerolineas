namespace Aero.Core;
public class Equipaje
{
    public required int id_Equipaje { get; set; }
    public required int id_checkin { get; set; }
    public required double peso { get; set; }
    public required string tipo { get; set; }
    public required string etiqueta_codigo { get; set; }
}
