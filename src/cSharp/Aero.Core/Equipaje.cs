namespace Aero.Core;
public class Equipaje
{
    public required int IdEquipaje { get; set; }
    public required int IdCheckin { get; set; }
    public required double Peso { get; set; }
    public required string Tipo { get; set; }
    public required string Etiqueta_codigo { get; set; }
}
