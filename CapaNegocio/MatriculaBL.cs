using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaDato;
using CapaEntidad;

namespace CapaNegocio
{
     public class MatriculaBL : Interface.IMatricula

    {
        private Datos datos = new DatosSQL();

        public string Mensaje { get; set; }

        public bool Agregar(Matricula matricula)
        {
            DataRow fila = datos.TraerDataRow("spAgregarMatricula", matricula.Periodo, matricula.Promedio, matricula.CourseID, matricula.StudentID);
            Mensaje = fila["Mensaje"].ToString();
            return Convert.ToInt32(fila["CodError"]) == 0;
        }

        public bool Eliminar(int enrollmentID)
        {
            DataRow fila = datos.TraerDataRow("spEliminarMatricula", enrollmentID);
            Mensaje = fila["Mensaje"].ToString();
            return Convert.ToInt32(fila["CodError"]) == 0;
        }

        public bool Actualizar(string enrollmentID, string periodo, string promedio, string courseID, string studentID)
        {
            DataRow fila = datos.TraerDataRow("spActualizarMatricula", enrollmentID, periodo, promedio, courseID, studentID);

            // Obtener el mensaje del procedimiento almacenado para llevarlo al formulario
            Mensaje = fila["Mensaje"].ToString();

            // Verificar el código de error para determinar si la actualización fue exitosa
            byte codError = Convert.ToByte(fila["CodError"]);
            return codError == 0;
        }




        public DataTable Listar()
        {
            return datos.TraerDataTable("spListarMatricula");
        }

        public DataTable Buscar(int enrollmentID, int courseID, int studentID)
        {
            return datos.TraerDataTable("sp_BuscarMatriculaPorParametros", enrollmentID, courseID, studentID);
        }
    }


}

