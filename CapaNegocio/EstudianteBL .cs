using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaDato;
using CapaEntidad;
using CapaNegocio.Interface;

namespace CapaNegocio
{
     public class EstudianteBL : Interface.IEstudiante

    {
        // Llamar a la capa de datos
        private Datos datos = new DatosSQL();

        // Mensaje del procedimiento almacenado
        public string Mensaje { get; set; }
        public DataTable Listar()
        {
            return datos.TraerDataTable("spListarEstudiante");
        }



        public bool Agregar(Estudiante estudiante)
        {
            DataRow fila = datos.TraerDataRow("spAgregarEstudiante", estudiante.CodEst, estudiante.NombEst);
            // Traer el mensaje del PA para llevarlo a formulario
            Mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public bool Eliminar(string codEst)
        {
            DataRow fila = datos.TraerDataRow("spEliminarEstudiante", codEst);
            // Traer el mensaje del PA para llevarlo a formulario
            Mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public bool Actualizar(Estudiante estudiante)
        {
            DataRow fila = datos.TraerDataRow("spActualizarEstudiante", estudiante.CodEst, estudiante.NombEst);
            // Traer el mensaje del PA para llevarlo a formulario
            Mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public DataTable Buscar(string nombEst)
        {
            return datos.TraerDataTable("spBuscarEstudiantePorNombre", nombEst);


        }


    }
}
