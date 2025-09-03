namespace Aero.Core;

public class Reservas
{
    public int IdReserva { get; set; }
    public int IdPasajero { get; set; }
    public int IdVuelo { get; set; }
    public DateTime FechaReserva { get; set; }
    public string ?Clase { get; set; }
    public decimal Precio { get; set; }
    public string ?Asiento { get; set; }
}