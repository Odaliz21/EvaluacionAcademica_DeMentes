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
     public class AsignaturaBL : Interface.IAsignatura

    {
        // llmar a la capadato

        private Datos datos = new DatosSQL();

        // mensaje del procedimiento almacenado
        public string Mensaje{get; set;}

        public DataTable Listar ()
        {
            return datos.TraerDataTable("spListarAsignatura");
        }
        public bool Agregar(Asignatura asignatura)
        {
            DataRow fila = datos.TraerDataRow("spAgregarAsignatura", asignatura.CodAsignatura, asignatura.Nomb_asignatura, asignatura.Creditos);
            //traer el mensaje del PA para llaverlo a formulario
            Mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
         }

        public bool Eliminar(string CodAsignatura)
        {
            DataRow fila = datos.TraerDataRow("spEliminarAsignatura", CodAsignatura);
            //traer el mensaje del PA para llaverlo a formulario
            Mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }

        public bool Actualizar(Asignatura asignatura)
        {
            DataRow fila = datos.TraerDataRow("spActualizarAsignatura", asignatura.CodAsignatura, asignatura.Nomb_asignatura, asignatura.Creditos);
            //traer el mensaje del PA para llevarlo al formulario
            Mensaje = fila["Mensaje"].ToString();
            byte codError = Convert.ToByte(fila["CodError"]);
            if (codError == 0) return true;
            else return false;
        }
        public DataTable Buscar(string nomb_asignatura)
        {
            return datos.TraerDataTable("sp_BuscarAsignatura", nomb_asignatura);
        }
    }
}
