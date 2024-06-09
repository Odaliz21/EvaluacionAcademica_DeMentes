using CapaEntidad;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CapaPresentacion1
{
	public partial class frmMatricula : System.Web.UI.Page
	{

		private MatriculaBL matriculaBL = new MatriculaBL();

		private void Listar()
		{
			gvMatricula.DataSource = matriculaBL.Listar();
			gvMatricula.DataBind();
			btnActualizar.Visible = false;
		}

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
				Listar();
		}

		protected void btnAgregar_Click(object sender, EventArgs e)
		{
			try
			{
				Matricula matricula = new Matricula
				{
					EnrollmentID = int.Parse(txtEnrollmentID.Text.Trim()),
					CourseID = int.Parse(txtCourseID.Text.Trim()),
					StudentID = int.Parse(txtStudentID.Text.Trim()),
					Periodo = txtPeriodo.Text.Trim(),
					Promedio = int.Parse(txtPromedio.Text.Trim())
				};

				if (matriculaBL.Agregar(matricula))
				{
					Listar();
					lblMensaje.Text = "Matrícula agregada correctamente.";
				}
				else
				{
					lblMensaje.Text = "Error al agregar la matrícula.";
				}
			}
			catch (Exception ex)
			{
				lblMensaje.Text = "Error: " + ex.Message;
			}
		}

		protected void btnEliminar_Click(object sender, EventArgs e)
		{
			int enrollmentID = int.Parse(txtEnrollmentID.Text.Trim());

			string confirmScript = @"if(confirm('¿Estás seguro de que deseas eliminar esta matrícula?')) { __doPostBack('', ''); }";
			ScriptManager.RegisterStartupScript(this, this.GetType(), "confirm", confirmScript, true);

			if (matriculaBL.Eliminar(enrollmentID))
			{
				Listar();
				lblMensaje.Text = "Matrícula eliminada correctamente.";
			}
			else
			{
				lblMensaje.Text = "Error al eliminar la matrícula.";
			}
		}

		protected void btnActualizar_Click(object sender, EventArgs e)
		{
			if (gvMatricula.SelectedRow != null)
			{
				// Crear una instancia de MatriculaBL
				MatriculaBL matriculaBL = new MatriculaBL();

				// Obtener los valores del formulario
				string enrollmentID = txtEnrollmentID.Text.Trim();
				string periodo = txtPeriodo.Text.Trim();
				string promedio = txtPromedio.Text.Trim();
				string courseID = txtCourseID.Text.Trim();
				string studentID = txtStudentID.Text.Trim();

				// Actualizar la matrícula y mostrar el mensaje
				bool actualizado = matriculaBL.Actualizar(enrollmentID, periodo, promedio, courseID, studentID);

				if (actualizado)
				{
					Listar();
					lblMensaje.Text = "Matrícula actualizada correctamente.";
					LimpiarFormulario();
				}
				else
				{
					lblMensaje.Text = "Error al actualizar la matrícula.";
				}
			}
		}


		protected void gvMatricula_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (gvMatricula.SelectedRow != null)
			{
				GridViewRow row = gvMatricula.SelectedRow;
				string enrollmentID = row.Cells[1].Text;
				string courseID = row.Cells[4].Text;
				string studentID = row.Cells[5].Text;
				string periodo = row.Cells[2].Text;
				string promedio = row.Cells[3].Text;

				txtEnrollmentID.Text = enrollmentID;
				txtCourseID.Text = courseID;
				txtStudentID.Text = studentID;
				txtPeriodo.Text = periodo;
				txtPromedio.Text = promedio;

				btnActualizar.Visible = true;
				txtEnrollmentID.Enabled = false;
			}
		}

		protected void btnBuscar_Click(object sender, EventArgs e)
		{
			int enrollmentID = string.IsNullOrWhiteSpace(txtBuscarEnrollmentID.Text) ? 0 : int.Parse(txtBuscarEnrollmentID.Text.Trim());
			int courseID = string.IsNullOrWhiteSpace(txtBuscarCourseID.Text) ? 0 : int.Parse(txtBuscarCourseID.Text.Trim());
			int studentID = string.IsNullOrWhiteSpace(txtBuscarStudentID.Text) ? 0 : int.Parse(txtBuscarStudentID.Text.Trim());

			DataTable resultadosBusqueda = matriculaBL.Buscar(enrollmentID, courseID, studentID);
			if (resultadosBusqueda != null && resultadosBusqueda.Rows.Count > 0)
			{
				gvMatricula.DataSource = resultadosBusqueda;
				gvMatricula.DataBind();
				lblMensaje.Text = "";
			}
			else
			{
				lblMensaje.Text = "No se encontraron matrículas con los parámetros proporcionados.";
				gvMatricula.DataSource = null;
				gvMatricula.DataBind();
			}
		}

		private void LimpiarFormulario()
		{
			txtEnrollmentID.Text = "";
			txtCourseID.Text = "";
			txtStudentID.Text = "";
			txtPeriodo.Text = "";
			txtPromedio.Text = "";
		}

		protected void BtnVer_todo_Click(object sender, EventArgs e)
		{
			Listar();
		}
	}
	}