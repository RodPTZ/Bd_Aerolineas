namespace Aero.Core;

public class Checkin
{
    public int IdCheckin { get; set; }
    public int IdReserva { get; set; }
    public DateTime FechaCheckin { get; set; }
    public string? Asiento { get; set; }
    public bool EquipajeBodega { get; set; }

}