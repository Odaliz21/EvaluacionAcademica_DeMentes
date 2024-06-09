using CapaEntidad;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;



namespace CapaServicio
{
    /// <summary>
    /// Descripción breve de WSEstudiante
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class WSEstudiante : System.Web.Services.WebService
    {

        private EstudianteBL estudianteBL = new EstudianteBL(); // Instancia de EstudianteBL

        [WebMethod]
        public DataTable ListarEstudiantes()
        {
            return estudianteBL.Listar();
        }

        [WebMethod]
        public bool AgregarEstudiante(string CodEstudiante, string NombreEstudiante)
        {
            Estudiante estudiante = new Estudiante();
            estudiante.CodEst = CodEstudiante;
            estudiante.NombEst = NombreEstudiante;
            return estudianteBL.Agregar(estudiante);
        }

        [WebMethod]
        public bool ActualizarEstudiante(string CodEstudiante, string NombreEstudiante)
        {
            Estudiante estudiante = new Estudiante();
            estudiante.CodEst = CodEstudiante;
            estudiante.NombEst = NombreEstudiante;
            return estudianteBL.Actualizar(estudiante);
        }

        [WebMethod]
        public bool EliminarEstudiante(string CodEstudiante)
        {
            return estudianteBL.Eliminar(CodEstudiante);
        }

        [WebMethod]
        public DataTable BuscarEstudiante(string NombreEstudiante)
        {
            return estudianteBL.Buscar(NombreEstudiante);
        }
    }
}
