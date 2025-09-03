using System;

namespace Aero.Core;

public class Vuelos
{
    public required int IdVuelo { get; set; }
    public required string NumeroVuelo { get; set; }
    public required int IdOrigen { get; set; }
    public required int IdDestino { get; set; }
    public required DateTime FechaSalida { get; set; }
    public required DateTime FechaLlegada { get; set; }
    public required string Matriculas { get; set; }
    public required string Estado { get; set; }
}