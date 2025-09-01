namespace Aero.Core;

public class Reservas
{
    public int idReserva { get; set; }
    public int idPasajero { get; set; }
    public int id_vuelo { get; set; }
    public DateTime fechaReserva { get; set; }
    public string ?clase { get; set; }
    public decimal precio { get; set; }
    public string ?asiento { get; set; }
}