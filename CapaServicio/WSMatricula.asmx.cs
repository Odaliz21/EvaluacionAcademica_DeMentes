
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
    /// Descripción breve de WSMatricula
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class WSMatricula : System.Web.Services.WebService
    {

        private MatriculaBL matriculaBL = new MatriculaBL();


        [WebMethod]
        public DataTable ListarMatricula()
        {
            return matriculaBL.Listar();
        }


        [WebMethod]
        public bool AgregarMatricula(string periodo, int promedio, int courseID, int studentID)
        {
            var matricula = new Matricula
            {
                Periodo = periodo,
                Promedio = promedio,
                CourseID = courseID,
                StudentID = studentID
            };

            bool result = matriculaBL.Agregar(matricula);
            Context.Response.AddHeader("Mensaje", matriculaBL.Mensaje);
            return result;
        }

        [WebMethod]
        public bool EliminarMatricula(int enrollmentID)
        {
            bool result = matriculaBL.Eliminar(enrollmentID);
            Context.Response.AddHeader("Mensaje", matriculaBL.Mensaje);
            return result;
        }

        [WebMethod]
        public bool ActualizarMatricula(int enrollmentID, string periodo, string promedio, int courseID, int studentID)
        {
            bool result = matriculaBL.Actualizar(enrollmentID.ToString(), periodo, promedio.ToString(), courseID.ToString(), studentID.ToString());
            Context.Response.AddHeader("Mensaje", matriculaBL.Mensaje);
            return result;
        }

       
        [WebMethod]
        public DataTable BuscarMatricula(int enrollmentID, int courseID, int studentID)
        {
            return matriculaBL.Buscar(enrollmentID, courseID, studentID);
        }
    }
}
