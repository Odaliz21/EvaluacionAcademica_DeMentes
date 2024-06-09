<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmMatricula.aspx.cs" Inherits="CapaPresentacion1.frmMatricula" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="container mt-5">
       <div class="card">
           <div class="card-header text-center bg-primary text-white">
        <h2 class="text-center">Mantenimiento de la Tabla Matrícula</h2>
          </div>
     <div class="card-body">
        <div class="form-group">
            <label for="txtEnrollmentID">ID de Matrícula</label>
            <asp:TextBox runat="server" ID="txtEnrollmentID" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtPeriodo">Periodo</label>
            <asp:TextBox runat="server" ID="txtPeriodo" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtPromedio">Promedio</label>
            <asp:TextBox runat="server" ID="txtPromedio" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtCourseID">ID del Curso</label>
            <asp:TextBox runat="server" ID="txtCourseID" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="txtStudentID">ID del Estudiante</label>
            <asp:TextBox runat="server" ID="txtStudentID" CssClass="form-control" style="margin-bottom: 10px;"></asp:TextBox>
        </div>

        <div class="form-group" style="display: inline-block;">
            <asp:Button Text="Agregar" runat="server" ID="btnAgregar" CssClass="btn btn-primary" OnClick="btnAgregar_Click" style="margin-bottom: 10px;"/>
        </div>
        <div class="form-group" style="display: inline-block;">
            <asp:Button Text="Eliminar" runat="server" ID="btnEliminar" CssClass="btn btn-warning mb-2" OnClick="btnEliminar_Click" />
        </div>
        <div class="form-group" style="display: inline-block;">
            <asp:Button Text="Actualizar" runat="server" ID="btnActualizar" CssClass="btn btn-success mb-2" OnClick="btnActualizar_Click" />
        </div>
        
        <div class="form-group">
            <label for="txtBuscarEnrollmentID">Buscar por ID de Matrícula</label>
            <asp:TextBox runat="server" ID="txtBuscarEnrollmentID" CssClass="form-control" Placeholder="ID de Matrícula"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtBuscarCourseID">Buscar por ID de Curso</label>
            <asp:TextBox runat="server" ID="txtBuscarCourseID" CssClass="form-control" Placeholder="ID de Curso"></asp:TextBox>
        </div>
        <div class="form-group">
            <label for="txtBuscarStudentID">Buscar por ID de Estudiante</label>
            <asp:TextBox runat="server" ID="txtBuscarStudentID" CssClass="form-control" Placeholder="ID de Estudiante"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button runat="server" ID="btnBuscar" Text="Buscar" OnClick="btnBuscar_Click" CssClass="btn btn-danger"></asp:Button>
        </div>

        <div class="form-group">
            <asp:Button runat="server" ID="BtnVer_todo" Text="Ver toda lista Matrícula" OnClick="BtnVer_todo_Click" CssClass="btn btn-info mt-2 btn-block" />
        </div>

        <div class="table-container">
            <asp:GridView runat="server" ID="gvMatricula" CssClass="table table-striped" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvMatricula_SelectedIndexChanged"></asp:GridView>
        </div>

        <div class="message">
            <asp:Label Text="" runat="server" ID="lblMensaje" CssClass="form-control-static"></asp:Label>
                      </div>
        </div>
    </div>
</div>
</asp:Content>
