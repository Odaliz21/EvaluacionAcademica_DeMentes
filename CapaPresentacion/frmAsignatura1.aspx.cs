using CapaEntidad;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion
{
    public partial class frmAsignatura1 : System.Web.UI.Page
    {
        private void Listar()
        {
            AsignaturaBL asignaturaBL = new AsignaturaBL();
            gvAsignatura.DataSource = asignaturaBL.Listar();
            gvAsignatura.DataBind();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Listar();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Asignatura asignatura = new Asignatura();

            asignatura.CodAsignatura = txtCodAsignatura.Text.Trim();
            asignatura.Nomb_asignatura = txtNomb_asignatura.Text.Trim();
            asignatura.Creditos = txtCreditos.Text.Trim();

            AsignaturaBL asignaturaBL = new AsignaturaBL();
            if (asignaturaBL.Agregar(asignatura))
                Listar();
            lblMensaje.Text = asignaturaBL.Mensaje;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string CodAsignatura = txtCodAsignatura.Text.Trim();

            // Mostrar un cuadro de diálogo de confirmación utilizando JavaScript
            string confirmScript = @"if(confirm('¿Estás seguro de que deseas eliminar este alumno?')) { __doPostBack('', ''); }";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "confirm", confirmScript, true);

            AsignaturaBL asignaturaBL = new AsignaturaBL();
            if (asignaturaBL.Eliminar(CodAsignatura))
            {
                Listar();
                lblMensaje.Text = asignaturaBL.Mensaje;
            }
        }



        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            Asignatura asignatura = new Asignatura();

            asignatura.CodAsignatura = txtCodAsignatura.Text.Trim();
            asignatura.Nomb_asignatura = txtNomb_asignatura.Text.Trim();
            asignatura.Creditos = txtCreditos.Text.Trim();

            AsignaturaBL asignaturaBL = new AsignaturaBL();
            if (asignaturaBL.Actualizar(asignatura))
                Listar(); // Refresh the list after updating.
            lblMensaje.Text = asignaturaBL.Mensaje;
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                string CodAsignatura = txtBuscar.Text.Trim();

                if (!string.IsNullOrEmpty(CodAsignatura))
                {
                    AsignaturaBL alumnoBL = new AsignaturaBL();
                    DataTable dt = alumnoBL.Buscar(CodAsignatura);

                    if (dt != null && dt.Rows.Count > 0)
                    {
                        gvAsignatura.DataSource = dt;
                        gvAsignatura.DataBind();
                        lblMensaje.Text = "Se encontró el alumno con el código proporcionado.";
                        lblMensaje.Text = "Código encontrado: " + CodAsignatura;



                    }
                    else
                    {
                        // Limpiar el GridView y mostrar mensaje de no encontrado
                        gvAsignatura.DataSource = null;
                        gvAsignatura.DataBind();
                        lblMensaje.Text = "No se encontraron alumnos con el código proporcionado.";
                    }
                }
                else
                {
                    // Mostrar mensaje de error si no se proporciona ningún código
                    lblMensaje.Text = "Por favor ingrese un código de alumno para buscar.";
                }
            }
            catch (Exception ex)
            {
                // Mostrar mensaje de error si ocurre alguna excepción
                lblMensaje.Text = "Error al buscar alumno: " + ex.Message;
            }
        }
    }
}