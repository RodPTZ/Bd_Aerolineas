namespace Aero.Core;

public class Checkin
{
    public int idCheckin { get; set; }
    public int idReserva { get; set; }
    public DateTime fechaCheckin { get; set; }
    public string? asiento { get; set; }
    public bool equipajeBodega { get; set; }

}