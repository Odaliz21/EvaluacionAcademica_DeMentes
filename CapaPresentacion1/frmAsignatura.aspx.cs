using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaEntidad;
using CapaNegocio;

namespace CapaPresentacion1
{
    public partial class frmAsignatura : System.Web.UI.Page

    {
        private AsignaturaBL asignaturaBL = new AsignaturaBL();
        private void Listar()
        {
            AsignaturaBL asignaturaBL = new AsignaturaBL();
            gvAsignatura.DataSource = asignaturaBL.Listar();
            gvAsignatura.DataBind();
            btnActualizar.Visible = false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Listar();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Asignatura asignatura = new Asignatura
            {
                CodAsignatura = txtCodAsignatura.Text.Trim(),
                Nomb_asignatura = txtNomb_asignatura.Text.Trim(),
                Creditos = txtCreditos.Text.Trim()
            };

            AsignaturaBL asignaturaBL = new AsignaturaBL();
            if (asignaturaBL.Agregar(asignatura))
                Listar();
            lblMensaje.Text = asignaturaBL.Mensaje;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string CodAsignatura = txtCodAsignatura.Text.Trim();

            // Mostrar un cuadro de diálogo de confirmación utilizando JavaScript
            string confirmScript = @"if(confirm('¿Estás seguro de que deseas eliminar esta asignatura?')) { __doPostBack('', ''); }";
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
            if (gvAsignatura.SelectedRow != null)
            {
                string codAsignatura = txtCodAsignatura.Text.Trim();
                string nomb_asignatura = txtNomb_asignatura.Text.Trim();
                string Creditos = txtCreditos.Text.Trim();

                Asignatura asignatura = new Asignatura()
                {
                    CodAsignatura = codAsignatura,
                    Nomb_asignatura = nomb_asignatura,
                    Creditos = Creditos
                };

                AsignaturaBL asignaturaBL = new AsignaturaBL();
                bool actualizado = asignaturaBL.Actualizar(asignatura);

                if (actualizado)
                {
                    Listar();
                    lblMensaje.Text = "Asignatura actualizada correctamente.";
                    LimpiarFormulario();
                }
                else
                {
                    lblMensaje.Text = "Error al actualizar la asignatura.";
                }
            }
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable resultadoBusqueda = asignaturaBL.Buscar(txtNombreBuscar.Text.Trim());
            if (resultadoBusqueda != null && resultadoBusqueda.Rows.Count > 0)
            {
                gvAsignatura.DataSource = resultadoBusqueda;
                gvAsignatura.DataBind();
                lblMensaje.Text = "";
            }
            else
            {
                lblMensaje.Text = "No se encontraron asignaturas con el nombre proporcionado.";
                gvAsignatura.DataSource = null;
                gvAsignatura.DataBind();
            }
        }


        protected void BtnVer_todo_Click(object sender, EventArgs e)
        {
            Listar();
        }

        protected void gvAsignatura_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvAsignatura.SelectedRow != null)
            {
                GridViewRow row = gvAsignatura.SelectedRow;
                string CodAsignatura = row.Cells[2].Text;
                string Nomb_asignatura = row.Cells[3].Text;
                string Creditos = row.Cells[4].Text;

                txtCodAsignatura.Text = CodAsignatura;
                txtNomb_asignatura.Text = Nomb_asignatura;
                txtCreditos.Text = Creditos;

                btnActualizar.Visible = true;
                txtCodAsignatura.Enabled = false;
            }
        }
        private void LimpiarFormulario()
        {
            txtCodAsignatura.Text = "";
            txtNomb_asignatura.Text = "";
            txtCreditos.Text = "";
        }
    }
}
