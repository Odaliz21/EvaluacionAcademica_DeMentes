using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaEntidad;  //  llamar al mapeado 
using System.Data;  // llamar buffer de la memoria : tablas con registros


namespace CapaNegocio.Interface
{
    interface IEstudiante
    {
        DataTable Listar();
        bool Agregar(Estudiante estudiante);
        bool Eliminar(string codEst);
        bool Actualizar(Estudiante estudiante);
        DataTable Buscar(string nombEst);

    }
}
