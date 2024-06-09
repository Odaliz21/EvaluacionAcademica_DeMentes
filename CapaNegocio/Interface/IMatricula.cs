using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaEntidad;  //  llamar al mapeado 
using System.Data;  // llamar buffer de la memoria : tablas con registros


namespace CapaNegocio.Interface
{
    interface IMatricula
    {
        DataTable Listar();
        bool Agregar(Matricula matricula);
        bool Eliminar(int enrollmentID);
        bool Actualizar(string enrollmentID, string periodo, string promedio, string courseID, string studentID);
        DataTable Buscar(int enrollmentID, int courseID, int studentID);

    }
}
