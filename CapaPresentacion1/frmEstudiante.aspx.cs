using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidad;



namespace CapaPresentacion1
{
    public partial class frmEstudiante : System.Web.UI.Page
    {
        private EstudianteBL estudianteBL = new EstudianteBL();

        private void Listar()
        {
            EstudianteBL estudianteBL = new EstudianteBL();
            gvEstudiante.DataSource = estudianteBL.Listar();
            gvEstudiante.DataBind();
            btnActualizar.Visible = false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Listar();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Estudiante estudiante = new Estudiante
            {
                CodEst = txtCodEst.Text.Trim(),
                NombEst = txtNombEst.Text.Trim()
            };

            if (estudianteBL.Agregar(estudiante))
                Listar();
            lblMensaje.Text = estudianteBL.Mensaje;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string CodEst = txtCodEst.Text.Trim();

            // Mostrar un cuadro de diálogo de confirmación utilizando JavaScript
            string confirmScript = @"if(confirm('¿Estás seguro de que deseas eliminar este estudiante?')) { __doPostBack('', ''); }";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "confirm", confirmScript, true);

            if (estudianteBL.Eliminar(CodEst))
            {
                Listar();
                lblMensaje.Text = estudianteBL.Mensaje;
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (gvEstudiante.SelectedRow != null)
            {
                string codEst = txtCodEst.Text.Trim();
                string nombEst = txtNombEst.Text.Trim();

                Estudiante estudiante = new Estudiante()
                {
                    CodEst = codEst,
                    NombEst = nombEst
                };

                bool actualizado = estudianteBL.Actualizar(estudiante);

                if (actualizado)
                {
                    Listar();
                    lblMensaje.Text = "Estudiante actualizado correctamente.";
                    LimpiarFormulario();
                }
                else
                {
                    lblMensaje.Text = "Error al actualizar el estudiante.";
                }
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable resultadoBusqueda = estudianteBL.Buscar(txtNombreBuscar.Text.Trim());
            if (resultadoBusqueda != null && resultadoBusqueda.Rows.Count > 0)
            {
                gvEstudiante.DataSource = resultadoBusqueda;
                gvEstudiante.DataBind();
                lblMensaje.Text = "";
            }
            else
            {
                lblMensaje.Text = "No se encontraron estudiantes con el nombre proporcionado.";
                gvEstudiante.DataSource = null;
                gvEstudiante.DataBind();
            }
        }




        protected void gvEstudiante_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvEstudiante.SelectedRow != null)
            {
                GridViewRow row = gvEstudiante.SelectedRow;
                string CodEst = row.Cells[2].Text;
                string NombEst = row.Cells[3].Text;

                txtCodEst.Text = CodEst;
                txtNombEst.Text = NombEst;

                btnActualizar.Visible = true;
                txtCodEst.Enabled = false;
            }
        }

        private void LimpiarFormulario()
        {
            txtCodEst.Text = "";
            txtNombEst.Text = "";
        }

        protected void BtnVer_todo_Click(object sender, EventArgs e)
        {
            Listar();

        }
    }
}
