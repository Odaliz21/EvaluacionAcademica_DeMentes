using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using CapaEntidad;
using CapaNegocio;

namespace CapaServicio
{
    /// <summary>
    /// Descripción breve de WSAsignatura
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class WSAsignatura : System.Web.Services.WebService
    {

        private AsignaturaBL asignaturaBL = new AsignaturaBL(); // Instancia de AsignaturaBL

        [WebMethod]
        public DataTable ListarAsignaturas()
        {
            return asignaturaBL.Listar();
        }

        [WebMethod]
        public bool AgregarAsignatura(string CodAsignatura, string Nomb_asignatura, string Creditos)
        {
            Asignatura asignatura = new Asignatura();
            asignatura.CodAsignatura = CodAsignatura;
            asignatura.Nomb_asignatura = Nomb_asignatura;
            asignatura.Creditos = Creditos;
            return asignaturaBL.Agregar(asignatura);
        }

        [WebMethod]
        public bool ActualizarAsignatura(string CodAsignatura, string Nomb_asignatura, string Creditos)
        {
            Asignatura asignatura = new Asignatura();
            asignatura.CodAsignatura = CodAsignatura;
            asignatura.Nomb_asignatura = Nomb_asignatura;
            asignatura.Creditos = Creditos;
            return asignaturaBL.Actualizar(asignatura);
        }

        [WebMethod]
        public bool EliminarAsignatura(string CodAsignatura)
        {
            return asignaturaBL.Eliminar(CodAsignatura);
        }

        [WebMethod]
        public DataTable BuscarAsignatura(string nomb_asignatura)
        {
            return asignaturaBL.Buscar(nomb_asignatura);
        }


    }
}
