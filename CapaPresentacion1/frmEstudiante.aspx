<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmEstudiante.aspx.cs" Inherits="CapaPresentacion1.frmEstudiante" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="container mt-5">
       <div class="card">
           <div class="card-header text-center bg-primary text-white">
            <h2 class="text-center">Mantenimiento de la Tabla Estudiante</h2>
                 </div>
               <div class="card-body">
            <div class="form-group">
                <label for="txtCodEst">Código de Estudiante</label>
                <asp:TextBox runat="server" ID="txtCodEst" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
            <label for="txtNombEst">Nombre del Estudiante</label>
            <asp:TextBox runat="server" ID="txtNombEst" CssClass="form-control" style="margin-bottom: 10px;"></asp:TextBox>
            </div>

            <div class="form-group" style="display: inline-block;">
                <asp:Button Text="Agregar" runat="server" ID="btnAgregar" CssClass="btn btn-primary mb-2" style="margin-bottom: 10px;" OnClick="btnAgregar_Click" />
            </div>

            <div class="form-group" style="display: inline-block;">
                <asp:Button Text="Eliminar" runat="server" ID="btnEliminar" CssClass="btn btn-warning mb-2" OnClick="btnEliminar_Click" />
            </div>

            <div class="form-group" style="display: inline-block;">
                <asp:Button Text="Actualizar" runat="server" ID="btnActualizar" CssClass="btn btn-success mb-2" OnClick="btnActualizar_Click" />
            </div>

            <div class="form-group">
                <div class="input-group">
                    <asp:TextBox runat="server" ID="txtNombreBuscar" CssClass="form-control" Placeholder="Nombre"></asp:TextBox>
                    <div class="input-group-append">
                        <asp:Button runat="server" ID="btnBuscar" Text="Buscar" OnClick="btnBuscar_Click" CssClass="btn btn-danger"></asp:Button>
                    </div>
                </div>
            </div>

            <asp:Button runat="server" ID="BtnVer_todo" Text="Ver toda lista de Estudiantes" OnClick="BtnVer_todo_Click" CssClass="btn btn-info mt-2 btn-block" />

            <div class="table-container">
                <asp:GridView runat="server" ID="gvEstudiante" CssClass="table table-striped" AutoGenerateSelectButton="True" OnSelectedIndexChanged="gvEstudiante_SelectedIndexChanged"></asp:GridView>
            </div>

            <div class="message">
                <asp:Label Text="" runat="server" ID="lblMensaje" CssClass="form-control-static"></asp:Label>
                     </div>
        </div>
    </div>
</div>
</asp:Content>
