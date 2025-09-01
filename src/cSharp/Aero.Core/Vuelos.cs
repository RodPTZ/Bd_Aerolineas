namespace Aero.Core;

public class Vuelos
{
    public required int id_vuelo { get; set; }
    public required string numero_vuelo { get; set; }
    public required int id_origen { get; set; }
    public required int id_destino { get; set; }
    public required datetime fecha_salida { get; set; }
    public required datetime fecha_llegada { get; set; }
    public required string matriculas { get; set; }
    public required string estado { get; set; }
}