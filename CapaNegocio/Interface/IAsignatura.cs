using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaEntidad;  //  llamar al mapeado 
using System.Data;  // llamar buffer de la memoria : tablas con registros


namespace CapaNegocio.Interface
{
    interface IAsignatura
    {
        //declara los metodos de la Clase Asignatura
        DataTable Listar();
        bool Agregar(Asignatura asignatura);
        bool Eliminar(string CodAsignatura);
        bool Actualizar(Asignatura asignatura);
        DataTable Buscar(string nomb_asignatura);
    }
}
